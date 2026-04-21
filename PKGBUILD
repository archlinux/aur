# Maintainer: Guido Iodice <guido[dot]iodice[at]gmail[dot]com>

_pkgname=boomaga
pkgname=${_pkgname}-qt6-git
pkgver=3.0.0.r29.g6575833
pkgrel=1
pkgdesc="A virtual printer for viewing a document before printing it out using the physical printer. Qt6 port"
arch=('i686' 'x86_64')
url="http://www.boomaga.org"
license=('LGPL')
depends=('qt6-base' 'poppler' 'cups')
makedepends=('qt6-tools' 'git' 'cmake' 'snappy')
provides=('boomaga')
conflicts=('boomaga' 'boomaga-qt5' 'boomaga-git')
options=(!emptydirs)
install="${pkgname}.install"
source=("${_pkgname}::git+https://github.com/guiodic/boomaga-qt6.git")
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
         -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
         .
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="${pkgdir}/" install
    install -D -m755 scripts/installPrinter.sh "${pkgdir}"/usr/bin/
    install -D -m644 LGPL "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
