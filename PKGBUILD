# $Id$
# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=mingw-w64-xorg-util-macros
pkgver=1.19.3
pkgrel=1
pkgdesc="X.Org Autotools macros (mingw-w64)"
arch=(any)
license=('custom')
url="http://xorg.freedesktop.org/"
makedepends=('mingw-w64-configure')
source=(${url}/releases/individual/util/util-macros-${pkgver}.tar.bz2{,.sig})
sha512sums=('b9c7398a912c688a782eab5b1e0f6da2df11a430775c5c98fc3269f73a665de6eeb60d300a849e38d345714a6e51f74e9334cb6039767304cca4b93d823a53a2'
            'SKIP')
validpgpkeys=('3BB639E56F861FA2E86505690FDD682D974CA72A'
              '4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # "Alan Coopersmith <alan.coopersmith@oracle.com>"

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd util-macros-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
  
}

package() {
 for _arch in ${_architectures}; do
    cd "${srcdir}/util-macros-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    install -m755 -d "${pkgdir}/usr/${_arch}/lib"
    mv "${pkgdir}/usr/${_arch}/share/pkgconfig" "${pkgdir}/usr/${_arch}/lib/"
  done
} 
