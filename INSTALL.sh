# Pre- and post-install scriptlet to be packaged.

post_install() {
    echo "For periodic execution of pacautomation enable the included systemd "
    echo "timer: systemctl enable --now pacautomation.timer"
}
