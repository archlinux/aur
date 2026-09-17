# Maintainer: Jan Kroulik <jk at wo dot cz>

_pkgname=boomaga
pkgname=${_pkgname}-git
pkgver=3.5.0.r1.g34d7549
pkgrel=1
pkgdesc="A virtual printer for viewing a document before printing it out using the physical printer (Qt6)"
arch=('x86_64' 'aarch64')
url="https://www.boomaga.org"
license=('LGPL-2.1-or-later')
depends=('qt6-base' 'poppler' 'cups' 'zlib' 'hicolor-icon-theme')
makedepends=('qt6-tools' 'git' 'cmake')
provides=('boomaga')
conflicts=('boomaga' 'boomaga-qt5' 'boomaga-qt6-git')
options=(!emptydirs)
install="${pkgname}.install"
source=("${_pkgname}::git+https://github.com/Boomaga/boomaga.git#branch=master")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -B build -S "${_pkgname}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -D -m755 "${srcdir}/${_pkgname}/scripts/installPrinter.sh" "${pkgdir}/usr/bin/installPrinter.sh"
    install -D -m644 "${srcdir}/${_pkgname}/LGPL" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
