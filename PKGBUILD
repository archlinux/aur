# $Id$
# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=mingw-w64-xorg-util-macros
pkgver=1.19.2
pkgrel=1
pkgdesc="X.Org Autotools macros (mingw-w64)"
arch=(any)
license=('custom')
url="http://xorg.freedesktop.org/"
makedepends=('mingw-w64-configure')
source=(${url}/releases/individual/util/util-macros-${pkgver}.tar.bz2{,.sig})
sha512sums=('3f51504b27f0478c136126f15110cf3cdbba218c4d74a8e974cca1381c6e8364609bd0c444f2fb19aa86a7f4e848dfce4f4da940463b224036f75a60b3d88619'
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
