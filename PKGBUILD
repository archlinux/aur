pkgname=mingw-w64-rhash
pkgver=1.3.9
pkgrel=1
pkgdesc="Utility for verifying hash sums of files (mingw-w64)"
url="https://github.com/rhash/RHash"
license=('BSD')
arch=('any')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/rhash/RHash/archive//v${pkgver}.tar.gz")
sha256sums=('42b1006f998adb189b1f316bf1a60e3171da047a85c4aaded2d0d26c1476c9f6')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    cp -r "$srcdir/RHash-${pkgver}" build-${_arch} && pushd build-${_arch}
    ./configure --cc=${_arch}-gcc --ar=${_arch}-ar --prefix=/usr/${_arch} --target=${_arch} --extra-cflags="-D_FORTIFY_SOURCE=2 -O2 -pipe -fno-plt -fexceptions --param=ssp-buffer-size=4" --extra-ldflags="-Wl,-O1,--sort-common,--as-needed -fstack-protector"
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/build-${_arch}"
    make install-lib-headers install-lib-shared DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
