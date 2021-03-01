((nil . ((run-command-recipe-dir-locals-fn
          . (lambda ()
              (list
               (list :command-name "aur-prepare-release"
                     :display "Prepare AUR pkg binary release"
                     :command-line "updpkgsums && makepkg --printsrcinfo > .SRCINFO"
                     :working-dir (locate-dominating-file
                                   default-directory
                                   ".git"))))))))
