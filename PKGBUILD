# Maintainer: Jan Kroulik <jk at wo dot cz>

_pkgname=boomaga
pkgname=${_pkgname}-git
pkgver=r446.5ac61e4
pkgrel=2
pkgdesc="A virtual printer for viewing a document before printing it out using the physical printer"
arch=('i686' 'x86_64')
url="http://www.boomaga.org"
license=('LGPL')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'shared-mime-info' 'qt5-base' 'poppler>=0.26.5' 'libcups')
makedepends=('git' 'cmake' 'gcc')
provides=('boomaga')
conflicts=('boomaga' 'boomaga-qt5')
options=(!emptydirs)
install="${pkgname}.install"
source=("${_pkgname}::git+https://github.com/Boomaga/boomaga.git#branch=master")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    cmake \
         -DCMAKE_INSTALL_PREFIX=/usr \
         -DCMAKE_BUILD_TYPE=Release \
         .
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="${pkgdir}/" install
    install -D -m755 scripts/installPrinter.sh "${pkgdir}"/usr/bin/
    install -D -m644 LGPL "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
