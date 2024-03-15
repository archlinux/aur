# Maintainer: Lars Grüter <lagru+pacautomation@mailbox.org>

pkgname="pacautomation"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="Periodic background service for automated maintenance around pacman."
arch=("any")
url="https://gitlab.com/lagru/pacautomation"
license=("GPL-2.0-or-later")
depends=("python>=3.11" "hicolor-icon-theme")
optdepends=("breeze-icons: icons for desktop notifications")
backup=("etc/pacautomation.conf")
install="pacautomation.install"
changelog="CHANGELOG.md"
source=("https://gitlab.com/lagru/pacautomation/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
# Update with updpkgsums
sha256sums=('b45870b4fd07d2983bb9afe46ef206bf2eb771b518b50abe8d39c5e25f462c1b')

build() {
    cd "${pkgname}-v${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname}-v${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    cd "src"
    install -Dm 644 "pacautomation.conf" -t "${pkgdir}/etc/"
    install -Dm 644 "pacautomation-notify.desktop" -t "${pkgdir}/etc/xdg/autostart/"
    install -Dm 644 "pacautomation.notifyrc" -t "${pkgdir}/usr/share/knotifications5/"
    install -Dm 644 "pacautomation.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"

    cp -r "systemd/" "${pkgdir}/usr/lib/"
    find "${pkgdir}/usr/lib/systemd/" -type d -exec chmod 755 {} \;
    find "${pkgdir}/usr/lib/systemd/" -type f -exec chmod 644 {} \;

    # Create spool directory
    install -dm 755 "${pkgdir}/var/spool/pacautomation/notify"
}

