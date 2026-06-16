# Maintainer: Artem Stasyuk <stasyukartem2@gmail.com>
pkgname=openfortivpn-gui-bin
pkgver=0.3.3
pkgrel=1
pkgdesc="A modern GTK4/libadwaita GUI client for Fortinet SSL VPN on Linux, wrapping the openfortivpn CLI tool."
arch=('x86_64')
url="https://github.com/shini4i/openfortivpn-gui"
license=('GPL-3.0-only')
depends=(
    'openfortivpn'
    'glibc'
    'glib2'
    'gtk4'
    'libadwaita'
    'gdk-pixbuf2'
    'pango'
    'cairo'
    'graphene'
    'hicolor-icon-theme'
)
source=("https://github.com/shini4i/openfortivpn-gui/releases/download/v${pkgver}/openfortivpn-gui_${pkgver}_linux_amd64.tar.gz"
        "openfortivpn-gui.desktop"
        "hicolor.tar.xz")
sha256sums=('578a35d704cef62814c71a8003e385d68af5b1190bcbe989ace54ee1a5fc1094'
            'bddd854827231fd6ac9a9f7b6ae6e607881af830bbd2687182ac23f577742c77'
            '61d2d0454a3d96355b202bcdfee0a59b1c38cc838c23b560cdf2e4edae2cef32')

package() {
    cd "${srcdir}"
    install -Dm755 "openfortivpn-gui" "${pkgdir}/usr/bin/openfortivpn-gui"
    install -Dm755 "openfortivpn-gui-helper" "${pkgdir}/usr/bin/openfortivpn-gui-helper"
    install -Dm644 "openfortivpn-gui.desktop" "${pkgdir}/usr/share/applications/openfortivpn-gui.desktop"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    mkdir -p "${pkgdir}/usr/share/icons/hicolor"
    cp -r "${srcdir}/hicolor/"* "${pkgdir}/usr/share/icons/hicolor/"
}
post_install() {
    if ! getent group openfortivpn-gui >/dev/null; then
        groupadd openfortivpn-gui
    fi

    echo ":: Enabling and starting openfortivpn-gui-helper service..."
    systemctl enable --now openfortivpn-gui-helper.service

    echo "========================================================================"
    echo " To enable passwordless VPN operations, add your user to the group:"
    echo "   sudo usermod -aG openfortivpn-gui \$USER"
    echo " Then, log out and log back in for the changes to take effect."
    echo "========================================================================"
}

post_remove() {
    systemctl disable --now openfortivpn-gui-helper.service
    
    if getent group openfortivpn-gui >/dev/null; then
        groupdel openfortivpn-gui
    fi
}
