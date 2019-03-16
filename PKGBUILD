# Maintainer: Jan Kroulik <jk at wo dot cz>

_pkgname=boomaga
pkgname=${_pkgname}-git
pkgver=3.0.0.r1.gff169ea
pkgrel=1
pkgdesc="A virtual printer for viewing a document before printing it out using the physical printer"
arch=('i686' 'x86_64')
url="http://www.boomaga.org"
license=('LGPL')
depends=('qt5-base' 'poppler' 'cups')
makedepends=('qt5-tools' 'git' 'cmake')
provides=('boomaga')
conflicts=('boomaga' 'boomaga-qt5')
options=(!emptydirs)
install="${pkgname}.install"
source=("${_pkgname}::git+https://github.com/Boomaga/boomaga.git#branch=master")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
