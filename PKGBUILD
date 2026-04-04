# Maintainer: aurnaur
pkgname=xscreensaver-tray
pkgver=1.0
pkgrel=2
pkgdesc="System tray toggle for xscreensaver with monitor icon"
arch=('any')
url="https://aur.archlinux.org/packages/xscreensaver-tray"
license=('MIT')
depends=('python' 'python-pyqt6' 'xscreensaver')
makedepends=()
source=()
md5sums=()

build() {
    true
}

package() {
    # Create directories if they don't exist
    mkdir -p "${pkgdir}/usr/local/bin"
    mkdir -p "${pkgdir}/etc/xdg/autostart"
    mkdir -p "${pkgdir}/home/${USER}/.config/systemd/user"

    # Install the script
    install -Dm755 "${srcdir}/../xscreensaver-tray" "${pkgdir}/usr/local/bin/xscreensaver-tray"

    # Install the autostart desktop file
    install -Dm644 "${srcdir}/../xscreensaver-tray.desktop" "${pkgdir}/etc/xdg/autostart/xscreensaver-tray.desktop"

    # Install the systemd service file
    install -Dm644 "${srcdir}/../xscreensaver.service" "${pkgdir}/home/${USER}/.config/systemd/user/xscreensaver.service"
}

post_install() {
    # Create user systemd directory if it doesn't exist
    mkdir -p ~/.config/systemd/user

    # Copy service file to user systemd directory
    cp /usr/local/bin/../xscreensaver.service ~/.config/systemd/user/ 2>/dev/null || true

    systemctl --user daemon-reload
    systemctl --user enable --now xscreensaver.service 2>/dev/null || true
    echo "==> xscreensaver.service enabled and started"
    echo "==> xscreensaver-tray will start automatically on next login"
}

post_remove() {
    systemctl --user disable --now xscreensaver.service 2>/dev/null || true
    rm -f ~/.config/systemd/user/xscreensaver.service
    systemctl --user daemon-reload
    echo "==> xscreensaver.service disabled and stopped"
}
