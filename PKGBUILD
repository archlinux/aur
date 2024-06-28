pkgname=mingw-w64-mbedtls2
pkgver=2.28.8
pkgrel=2
pkgdesc="Portable cryptographic and SSL/TLS library, aka polarssl (mingw-w64)"
arch=('any')
url="https://tls.mbed.org"
license=('Apache-2.0')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'git')
options=(!strip !buildflags staticlibs)
_tag=19cd99c38606b827bafa99bc9b790e78476a4b95
source=(git+https://github.com/ARMmbed/mbedtls.git#tag=${_tag}
	cmake-dll-soversion.patch)
b2sums=('995087e908cdb6962ef358d1eb71fb887a678ebeeb0964cc2caa78c9b822959e33b66af1e402a176ccdf71195f3c230a04a24269275d6affc741b08eb850e052'
	'733df8cc31d7eac5a7b351be7fd96bc7a61ad7a53b744480179af2eee5ee97e3354488169bbbef23d9a777cff9b50a707409d53870df997599e791c9ed8a6cb0')

pkgver() {
  cd mbedtls
  git describe --tags | sed 's/^v//; s/^mbedtls-//'
}


_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "mbedtls"

  patch -Np1 -i "${srcdir}/cmake-dll-soversion.patch"
}

build() {
  cd "mbedtls"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DENABLE_PROGRAMS=OFF -DENABLE_TESTING=OFF \
      -DUSE_SHARED_MBEDTLS_LIBRARY=ON \
      -DMBEDTLS_FATAL_WARNINGS=OFF \
      -DCMAKE_INSTALL_INCLUDEDIR=include/mbedtls2 \
      -DCMAKE_INSTALL_LIBDIR=lib/mbedtls2 \
      -Wno-dev \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/mbedtls/build-${_arch}"
    make install DESTDIR="$pkgdir"
    install -dm 755 "${pkgdir}"/usr/${_arch}/include/mbedtls2
    mv "${pkgdir}"/usr/${_arch}/include/{everest,mbedtls,psa} "${pkgdir}"/usr/${_arch}/include/mbedtls2/
    install -d "$pkgdir"/usr/${_arch}/bin
    mv "$pkgdir"/usr/${_arch}/lib/mbedtls2/*.dll "$pkgdir"/usr/${_arch}/bin/
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/mbedtls2/*.a
  done
}
