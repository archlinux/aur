# Maintainer: Lars Grüter <lagru+pacautomation@mailbox.org>

pkgname=pacautomation
pkgver=0.14.5
pkgrel=1
pkgdesc="Background download of package upgrades and cache cleaning."
arch=("any")
url="https://gitlab.com/lagru/pacautomation"
license=("GPL")
depends=("python>=3.9")
optdepends=("breeze-icons: icons for desktop notifications")
backup=("etc/pacautomation.conf")
source=("https://gitlab.com/lagru/pacautomation/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
# Update with updpkgsums
sha256sums=('a20eb44c88729232685298c3a03578cd119af34ec5b68f52b15d0ab81e4abe20')

build() {
    cd "${pkgname}-v${pkgver}/src"
    # Prepare byte-code file for installation (not sure if this works)
    python -O -m compileall *.py
}

package() {
    cd "${pkgname}-v${pkgver}/src"
    install -Dm 644 "pacautomation.conf" -t "${pkgdir}/etc/"
    install -Dm 644 "pacautomation.service" -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm 644 "pacautomation.timer" -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm 644 "pacautomation.notifyrc" -t "${pkgdir}/usr/share/knotifications5/"
    install -Dm 644 "pacautomation.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
    install -Dm 755 "pacautomation.py" -t "${pkgdir}/usr/lib/${pkgname}/"
    cp -a "__pycache__" "${pkgdir}/usr/lib/${pkgname}/"

    install -dm 755 "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${pkgname}/pacautomation.py" "${pkgdir}/usr/bin/pacautomation"
}
