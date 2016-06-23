# Maintainer: Anton Batenev <antonbatenev@yandex.ru>

pkgname=('ekstertera')
pkgver=0.1.9
pkgrel=1
pkgdesc="GUI client for Yandex.Disk"
arch=('i686' 'x86_64')
url="https://github.com/abbat/${pkgname}"
license=('BSD')
depends=('qt5-base')
makedepends=('qt5-base' 'qt5-tools' 'git')
source=("git+https://github.com/abbat/${pkgname}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${pkgname}"

    PWD=$(pwd)

    qmake-qt5 -project -recursive -Wall -nopwd -o "${pkgname}.pro" \
        "CODEC = UTF-8" \
        "CODECFORTR = UTF-8" \
        "CONFIG += release" \
        "QT += network core widgets" \
        "INCLUDEPATH += src" \
        "${PWD}/src" "${PWD}/3dparty/json"

    lrelease -compress -removeidentical "${pkgname}.pro"
    qmake-qt5 "${pkgname}.pro"
    make
}

package() {
    cd "${pkgname}"

    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/pixmaps"
    install -d "${pkgdir}/usr/share/applications"

    install -D -m755 ${pkgname}               "${pkgdir}/usr/bin/${pkgname}"
    install -D -m644 ekstertera.desktop       "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -D -m644 src/icons/ekstertera.xpm "${pkgdir}/usr/share/pixmaps/${pkgname}.xpm"
    install -D -m644 README.md                "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -D -m644 debian/copyright         "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
