pkgname=mingw-w64-mbedtls2
pkgver=2.28.9
pkgrel=1
pkgdesc="Portable cryptographic and SSL/TLS library, aka polarssl (mingw-w64)"
arch=('any')
url="https://tls.mbed.org"
license=('Apache-2.0')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'git')
options=(!strip !buildflags staticlibs !debug)
_tag=b102d44b8500344336ddb5fdc6333aab18a99a34
source=(git+https://github.com/ARMmbed/mbedtls.git#tag=${_tag}
        cmake-dll-soversion.patch)
b2sums=('607ea3600ee6466a85919c6e6b6c66120fe8dd6033983e4cd782884fcf1178a587cd8556c78239718cc23686ed64f8349f4ff45d23510d90ae8d6837a05b83bd'
        '6d50435bf384fdc1748fdb9d4017fac3ec8546c0e9f532e8922f6f5144b5a370eb33ddb2e527ffdb898a53edde6859808772507023c24ee5bda92b2c04725d26')

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
