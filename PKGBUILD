# Maintainer: Oliver Liebmann
pkgname=jetbrains-project-launcher
pkgver=1.0.0
pkgrel=1
pkgdesc="Automatically creates desktop entries for JetBrains IDEs"
arch=('any')
url="https://github.com/OliverLiebmann/jetbrains-project-launcher"
license=('MIT')
depends=('bash' 'inotify-tools')
source=(
    "jetbrains-project-launcher.sh"
    "jetbrains-project-launcher.service"
    "jetbrains-project-launcher.conf"
)
sha256sums=('5bda5e6c01bb1cdabbc235b6528e38f282b2503462449b61e96aadc8f195a5c4'
            'e7ea6c434c1268c98c0463e42a2ab013f63690d1a21d384cfd013cf91331a16c'
            'f69b6f8ef539ad989b92287f22e08ac91e87d4e850df042fd783ce197d080aa9')

# Build step: optional for non-compiled packages
build() {
    echo "No build required for this script package."
}

# Packaging step: structure the installation
package() {
    # Install main script
    install -Dm755 "${srcdir}/jetbrains-project-launcher.sh" "${pkgdir}/usr/bin/jetbrains-project-launcher"

    # Install systemd service
    install -Dm644 "${srcdir}/jetbrains-project-launcher.service" "${pkgdir}/usr/lib/systemd/user/jetbrains-project-launcher.service"

    # Install configuration template
    install -Dm644 "${srcdir}/jetbrains-project-launcher.conf" "${pkgdir}/usr/share/doc/${pkgname}/jetbrains-project-launcher.conf"

    # Add post-installation instructions
    cat << EOF > "${pkgdir}/usr/share/doc/${pkgname}/README"
To set up JetBrains Project Launcher:

1. Copy the configuration template to your home directory:
   cp /usr/share/doc/${pkgname}/jetbrains-project-launcher.conf.template ~/.config/jetbrains-project-launcher.conf

2. Edit the configuration to suit your needs:
   nano ~/.config/jetbrains-project-launcher.conf

3. Enable and start the service:
   systemctl --user enable jetbrains-project-launcher.service
   systemctl --user start jetbrains-project-launcher.service
EOF
}

# Post-install message
post_install() {
    echo "JetBrains Project Launcher has been installed!"
    echo "Please copy and edit the configuration file as described in:"
    echo "  /usr/share/doc/${pkgname}/README"
    echo ""
    echo "Once configured, enable and start the service with:"
    echo "  systemctl --user enable jetbrains-project-launcher.service"
    echo "  systemctl --user start jetbrains-project-launcher.service"
}
