pkgname=mingw-w64-mbedtls
pkgver=2.23.0
pkgrel=1
pkgdesc="Portable cryptographic and SSL/TLS library, aka polarssl (mingw-w64)"
arch=('any')
url="https://tls.mbed.org"
license=('Apache')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=(!strip !buildflags staticlibs)
source=("https://github.com/ARMmbed/mbedtls/archive/mbedtls-${pkgver}.tar.gz")
sha256sums=('5c8998217402aa1fc734f4afaeac38fad2421470fac4b3abc112bd46391054fe')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "mbedtls-mbedtls-${pkgver}"
}

build() {
  cd "mbedtls-mbedtls-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DENABLE_PROGRAMS=OFF -DENABLE_TESTING=OFF \
      -DUSE_SHARED_MBEDTLS_LIBRARY=ON \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/mbedtls-mbedtls-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    install -d "$pkgdir"/usr/${_arch}/bin
    mv "$pkgdir"/usr/${_arch}/lib/*.dll "$pkgdir"/usr/${_arch}/bin
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
