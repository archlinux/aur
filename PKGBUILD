# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-libjpeg-turbo
pkgver=2.0.6
pkgrel=1
arch=(any)
pkgdesc="JPEG image codec with accelerated baseline compression and decompression (mingw-w64)"
license=("custom")
depends=(mingw-w64-crt)
makedepends=(yasm mingw-w64-cmake)
provides=(mingw-w64-libjpeg)
conflicts=(mingw-w64-libjpeg mingw-w64-libjpeg6-turbo)
options=(staticlibs !strip !buildflags)
url="http://libjpeg-turbo.virtualgl.org"
source=("http://downloads.sourceforge.net/libjpeg-turbo/libjpeg-turbo-$pkgver.tar.gz")
validpgpkeys=('0338C8D8D9FDA62CF9C421BD7EC2DBB6F4DBF434') # The libjpeg-turbo Project (Signing key for official binaries) <information@libjpeg-turbo.org>
sha512sums=('504062778224f2ed2ddb64c988fbf466a14247952aab0cf1d35d281942b6f0874eafd34b45914d2208e087f05ddd896c5ba87a67c944e8bb80323e187413038c')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/libjpeg-turbo-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DWITH_JPEG8=ON ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/libjpeg-turbo-$pkgver/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    if [[ $NO_EXECUTABLES ]]; then
      find "${pkgdir}/usr/${_arch}" -name '*.exe' -delete
    else
      find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip --strip-all {} \;
    fi
  done
}

# vim: ts=2 sw=2 et:
