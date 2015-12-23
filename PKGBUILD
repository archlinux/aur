# Maintainer: yourname <yourmail>
pkgname=mingw-w64-graphicsmagick
pkgver=1.3.23
pkgrel=1
pkgdesc="Image processing system (mingw-w64)"
arch=('any')
url="http://www.graphicsmagick.org"
license=('GPL')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("ftp://ftp.graphicsmagick.org/pub/GraphicsMagick/1.3/GraphicsMagick-$pkgver.tar.xz")
md5sums=('9885ff5d91bc215a0adb3be1185e9777')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/GraphicsMagick-$pkgver/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure --enable-shared --without-x --with-quantum-depth=16 --with-modules --with-threads
    sed -i "s/\/usr\/include/\/usr\/${_arch}\/include/g" Makefile
    sed -i "s/\/usr\/lib/\/usr\/${_arch}\/lib/g" Makefile
    make -j4
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/GraphicsMagick-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
