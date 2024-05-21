;;;; code:

;; straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(shell-command "setxkbmap -option ctrl:nocaps")

;; load in MELPA package support
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(global-set-key (kbd "C-c e s") 'eshell)

(straight-use-package
 '(buffer-query :type git :host github :repo "yothebob/buffer-query"))
(global-set-key (kbd "C-c b q") 'buffer-query)
(straight-use-package
 '(bb-mode :type git :host github :repo "yothebob/bb-mode"))
(require 'bb-mode)
(require 'buffer-query)

;; this was orignally set to replace and it was driving me crazy
(global-set-key (kbd "M-%") 'replace-regexp)

(setq magit-display-buffer-function #'magit-display-buffer-traditional)

(use-package anaconda-mode)

(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)
(add-hook 'python-mode-hook #'eglot-ensure)
(add-hook 'rust-mode-hook 'eglot-ensure)

(global-set-key [f9] 'menu-bar-mode)
(menu-bar-mode 0)
(display-time)
(tool-bar-mode 0)
(cua-mode 0)
(scroll-bar-mode 0)

(global-set-key (kbd "C-s") 'isearch-forward)
(global-set-key [(control shift s)] 'rgrep)
(global-set-key (kbd "C-c f r") 'replace-string)
(global-set-key (kbd "C-c f d") 'find-name-dired)

(global-set-key (kbd "C-c p f") 'project-find-file)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; for org mode, stop screwing with the indentation org!!!
(setq org-edit-src-content-indentation 0)
(setq org-src-preserve-indentation t)

(setq warning-minimum-level :emergency)
;;(setq warning-minimum-level :warning)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bongo-mode-line-icon-color "white")
 '(custom-enabled-themes '(zerodark))
 '(custom-safe-themes
   '("36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "77fff78cc13a2ff41ad0a8ba2f09e8efd3c7e16be20725606c095f9a19c24d3d" "8d3ef5ff6273f2a552152c7febc40eabca26bae05bd12bc85062e2dc224cde9a" "da75eceab6bea9298e04ce5b4b07349f8c02da305734f7c0c8c6af7b5eaa9738" "38c0c668d8ac3841cb9608522ca116067177c92feeabc6f002a27249976d7434" "a1c18db2838b593fba371cb2623abd8f7644a7811ac53c6530eebdf8b9a25a8d" "94a94c957cf4a3f8db5f12a7b7e8f3e68f686d76ae8ed6b82bd09f6e6430a32c" "e6886e2515d9835c33cd2df0d3890268a00878140a1c4b7a54cdb9ff7c63d05d" "90ce422bb0cbadf4a661bd08c89492509a099c258deae6f5ea87271723126c59" "9312a0692efc799e797c6689b3216c45d80e460184f666fffdb6dab65d8d4947" "57e3f215bef8784157991c4957965aa31bac935aca011b29d7d8e113a652b693" "e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "9e1cf0f16477d0da814691c1b9add22d7cb34e0bb3334db7822424a449d20078" "f32c4f062cf87591b8047b83c499bb57dcdfcee345b0398af2e8dff1e2aa275e" "c0f4b66aa26aa3fded1cbefe50184a08f5132756523b640f68f3e54fd5f584bd" default))
 '(dired-listing-switches "-al -h")
 '(display-line-numbers-type 'relative)
 '(global-display-line-numbers-mode t)
 '(httpd-host "192.168.157.59")
 '(org-babel-load-languages '((emacs-lisp . t) (python . t) (shell . t)))
 '(org-safe-remote-resources '("\\`https://fniessen\\.github\\.io\\(?:/\\|\\'\\)"))
 '(org-todo-keywords '((sequence "TODO" "FOLLOWUP" "DONE")))
 '(package-selected-packages
   '(sly typescript-mode eat ement persistent-scratch lsp-ui dap-mode company flycheck-kotlin kotlin-mode insecure-lock org-roam-ui devdocs ox-gfm org-make-toc counsel doom-modeline ox-reveal exwm zoxide zerodark-theme yaml-mode what-the-commit wgrep web-server wanderlust vterm vlf vimgolf uwu-theme use-package tramp-theme the-matrix-theme sweet-theme swagg sqlite3 sqlite speed-type smudge smex smart-jump slime skewer-mode session rust-mode python prettier popup-kill-ring phps-mode password-vault ox-json org-roam org-clock-csv ob-sql-mode ob-rust ob-restclient ob-php nginx-mode mermaid-mode magit leuven-theme ledger-mode jinx jazz-theme horizon-theme hardcore-mode gotham-theme god-mode go-mode gif-screencast frontside-javascript firefox-javascript-repl ffmpeg-player evil eslintd-fix emms emmet-mode elixir-yasnippets elixir-mode elfeed-tube-mpv eglot edit-color-stamp dumb-jump dracula-theme doom-themes docstr dockerfile-mode dmenu deadgrep dashboard dark-krystal-theme cyberpunk-theme cyberpunk-2019-theme ct csharp-mode counsel-tramp company-web company-php company-erlang company-emojify company-anaconda cherry-blossom-theme centaur-tabs catppuccin-theme cargo browse-kill-ring bongo blamer beacon auto-rename-tag auto-correct atom-one-dark-theme ample-theme all alert alarm-clock afternoon-theme ace-window ac-php ac-emoji))
 '(safe-local-variable-values
   '((eval progn
	   (org-babel-goto-named-src-block "startup")
	   (org-babel-execute-src-block)
	   (outline-hide-sublevels 1))))
 '(send-mail-function 'mailclient-send-it)
 '(smtpmail-smtp-server "mail.parthenonsoftware.com")
 '(smtpmail-smtp-service 587))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "DAMA" :slant normal :weight regular :height 120 :width normal)))))
;; To increase the font size, type 'C-x C-M-+' or 'C-x C-M-='; to decrease it, type 'C-x C-M--'; 
(server-start)
(cua-mode)


;; (require 'exwm)
;; (require 'exwm-config)
;; (exwm-config-example)
;; (global-set-key (kbd "s-d") 'dmenu)
;; for some reason the CDN works here, but not at home
;; #+REVEAL_ROOT: https://cdn.jsdelivr.net/npm/reveal.js

(add-to-list 'display-buffer-alist '("*Async Shell Command*" display-buffer-no-window (nil)))
;; (add-hook 'exwm-update-class-hook
;;           (lambda ()
;;           (exwm-workspace-rename-buffer exwm-class-name)))

;;; .emacs ends here
