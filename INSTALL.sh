# Pre- and post-install scriptlet to be packaged.

post_install() {
    systemctl enable --now pacautomation.timer
}
