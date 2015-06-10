# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>

pkgname=mingw-w64-opencore-amr
pkgver=0.1.3
pkgrel=2
pkgdesc="Open source implementation of the Adaptive Multi Rate (AMR) speech codec (mingw-w64)"
arch=('any')
license=('APACHE')
url="http://opencore-amr.sourceforge.net/"
source=(http://downloads.sourceforge.net/sourceforge/opencore-amr/opencore-amr-$pkgver.tar.gz)
depends=('mingw-w64-crt')
options=('!strip !buildflags !libtool staticlibs')
makedepends=('mingw-w64-gcc')
md5sums=('09d2c5dfb43a9f6e9fec8b1ae678e725')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/build-${_arch} && cd ${srcdir}/build-${_arch}
    unset LDFLAGS CPPFLAGS
    $srcdir/opencore-amr-$pkgver/configure --prefix=/usr/${_arch} --host=${_arch} --enable-static
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/build-${_arch}
    make DESTDIR="$pkgdir" install

    ${_arch}-strip -x -g ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
  done
}

