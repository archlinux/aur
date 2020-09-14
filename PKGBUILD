# Maintainer: Pest <pest@devault.cc>
_pkgname=devault
pkgname="${_pkgname}core"
pkgver=1.2.0
pkgrel=1
pkgdesc="QT Desktop wallet for the dvt blockchain"
arch=('x86_64')
license=('MIT')
url="https://github.com/devaultcrypto/"
conflicts=("${pkgname}-git")
source=(${_pkgname}::\
https://github.com/devaultcrypto/devault/archive/v${pkgver}.tar.gz)
depends=('boost-libs' 'qt5-base' 'qrencode' 'zeromq' 'miniupnpc' \
        'hicolor-icon-theme' 'libevent')
makedepends=('python' 'boost' 'qt5-tools' 'gcc')
md5sums=('08b4e6c47e1b2cf78a4639af41a907c1')

build() {
    cmake \
	-B build -S "${_pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE='None' \
	-DBUILD_CTESTS=0 \
        -Wno-dev
    make -C build
}

package(){
  mkdir -p "$pkgdir/usr/bin"
  cd "$srcdir/build/"
  install -D -m755 ./devault* "$pkgdir/usr/bin/"
  cd "$srcdir/${_pkgname}-${pkgver}"
  install -D -m644 \
   contrib/debian/devault-qt.desktop \
   "${pkgdir}/usr/share/applications/DeVault-Core.desktop"
  install -D -m644 \
   share/pixmaps/devault-128.png \
   "${pkgdir}/usr/share/icons/hicolor/128x128/apps/devault-128.png"
  install -D -m644 COPYING  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
