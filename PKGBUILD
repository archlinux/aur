# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Mihai Militaru <mihai militaru at xmpp dot ro>
# Contributor: carstene1ns <arch carsten-teibes.de>

pkgname=mingw-w64-mbedtls2
pkgver=2.28.10
pkgrel=1
pkgdesc="Portable cryptographic and SSL/TLS library, aka polarssl (mingw-w64)"
arch=('any')
url="https://tls.mbed.org"
license=('Apache-2.0')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'git')
options=(!strip !buildflags staticlibs !debug)
_tag=2fc8413bfcb51354c8e679141b17b3f1a5942561
source=(git+https://github.com/Mbed-TLS/mbedtls.git#tag=${_tag}
        cmake-dll-soversion.patch)
b2sums=('5556a44b7df49fb6cabf046915218cdd3f1176b5e63febae3697d7d5e701d1e0d97d0cb107c5ad4f852d8f4296ff1fe1bbfd21fe822b2a153ceccaf9849290d1'
        'e7b4e9201e6d720daafaa7b9619945c3bd0a595384f171d0d570f79b0fd404f4889e8e9a6aa62ad18142d9c7f14d19950c3e4cdf54a95d2a010caa38ed2003d9')

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
      -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
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
