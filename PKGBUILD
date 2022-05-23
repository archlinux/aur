# Maintainer: Lars Grüter <lagru+pacautomation@mailbox.org>

pkgname="pacautomation"
pkgver="0.18.1"
pkgrel="1"
pkgdesc="Periodic background service for automated maintenance around pacman."
arch=("any")
url="https://gitlab.com/lagru/pacautomation"
license=("GPL")
depends=("python>=3.10" "hicolor-icon-theme")
optdepends=("breeze-icons: icons for desktop notifications")
backup=("etc/pacautomation.conf")
install="pacautomation.install"
changelog="CHANGELOG.md"
source=("https://gitlab.com/lagru/pacautomation/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
# Update with updpkgsums
sha256sums=('ac0c19c022d5350c2623fe8a9ad935ec0b5995443881635cb53dcc291a3a180e')

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

    cp -r "systemd/" "${pkgdir}/usr/lib/systemd/"
    find "${pkgdir}/usr/lib/systemd/" -type d -exec chmod 755 {} \;
    find "${pkgdir}/usr/lib/systemd/" -type f -exec chmod 644 {} \;

    # Create spool directory
    install -dm 755 "${pkgdir}/var/spool/pacautomation/notify"
}
