# Maintainer: Lars Grüter <lagru+pacautomation@mailbox.org>

pkgname="pacautomation"
pkgver="0.16.2"
pkgrel="1"
pkgdesc="Background download of package upgrades and cache cleaning."
arch=("any")
url="https://gitlab.com/lagru/pacautomation"
license=("GPL")
depends=("python>=3.10" "hicolor-icon-theme")
optdepends=("breeze-icons: icons for desktop notifications")
checkdepends=("python-pytest")
backup=("etc/pacautomation.conf")
install="INSTALL.sh"
changelog="CHANGELOG.md"
source=("https://gitlab.com/lagru/pacautomation/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
# Update with updpkgsums
sha256sums=('7b7e2a39a91bf97cf802777775623f57a6b91e67b6fe531c6bc0b87c5d0cfcaa')

check() {
    cd "pacautomation-v${pkgver}"
    pytest "test/"
}

package() {
    cd "pacautomation-v${pkgver}/src"
    install -Dm 644 "pacautomation.conf" -t "${pkgdir}/etc/"
    install -Dm 644 "pacautomation.service" -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm 644 "pacautomation.timer" -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm 644 "pacautomation.notifyrc" -t "${pkgdir}/usr/share/knotifications5/"
    install -Dm 644 "pacautomation.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
    install -Dm 755 "pacautomation.py" -t "${pkgdir}/usr/lib/pacautomation/"

    # Compile PYC files so that they can be tracked by pacman
    python -m compileall -q -o 0 -o 1 -o 2 -d "/" "${pkgdir}"

    install -dm 755 "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${pkgname}/pacautomation.py" "${pkgdir}/usr/bin/pacautomation"
}
