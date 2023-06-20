# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Mihai Militaru <mihai militaru at xmpp dot ro>
# Contributor: carstene1ns <arch carsten-teibes.de>

pkgname=mbedtls2-dtls
pkgver=2.28.3
pkgrel=1
pkgdesc='An open source, portable, easy to use, readable and flexible TLS library (with DTLS support)'
arch=(x86_64)
url=https://tls.mbed.org
license=(Apache)
depends=(glibc)
checkdepends=(python)
makedepends=(
  cmake
  git
  ninja
)
provides=(
  libmbedcrypto.so
  libmbedtls.so
  libmbedx509.so
)
conflicts=(mbedtls2)
options=(staticlibs)
_tag=981743de6fcdbe672e482b6fd724d31d0a0d2476
source=(git+https://github.com/ARMmbed/mbedtls.git#tag=${_tag})
b2sums=(SKIP)

pkgver() {
  cd mbedtls
  git describe --tags | sed 's/^v//; s/^mbedtls-//'
}

prepare() {
  cd mbedtls
  sed -i -e "s|//#define MBEDTLS_SSL_DTLS_SRTP|#define MBEDTLS_SSL_DTLS_SRTP|" include/mbedtls/config.h
}

build() {
  export CFLAGS+=' -ffat-lto-objects'
  cmake -S mbedtls -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DENABLE_PROGRAMS=OFF \
    -DMBEDTLS_FATAL_WARNINGS=OFF \
    -DUSE_SHARED_MBEDTLS_LIBRARY=ON \
    -DUSE_STATIC_MBEDTLS_LIBRARY=OFF \
    -Wno-dev
  cmake --build build
}

check() {
  LD_LIBRARY_PATH="${srcdir}"/build/library ctest --test-dir build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  rm -rf "${pkgdir}"/usr/lib/{cmake,*.so}
  install -dm 755 "${pkgdir}"/usr/{include,lib}/mbedtls2
  mv "${pkgdir}"/usr/include/{mbedtls,psa} "${pkgdir}"/usr/include/mbedtls2/
  ln -s ../libmbedcrypto.so.7 "${pkgdir}"/usr/lib/mbedtls2/libmbedcrypto.so
  ln -s ../libmbedtls.so.14 "${pkgdir}"/usr/lib/mbedtls2/libmbedtls.so
  ln -s ../libmbedx509.so.1 "${pkgdir}"/usr/lib/mbedtls2/libmbedx509.so
}

# vim: ts=2 sw=2 et:
