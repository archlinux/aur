# Pre- and post-install scriptlet to be packaged.

post_install() {
    echo -ne "\e[34m"
    echo "Note: For periodic execution of pacautomation enable the included "
    echo -ne "      timer with: "
    echo -ne "\e[1m" # Print the actual command in bold
    echo "systemctl enable --now pacautomation.timer"
    echo -ne "\e[0m"
}
