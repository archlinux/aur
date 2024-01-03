# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Mihai Militaru <mihai militaru at xmpp dot ro>
# Contributor: carstene1ns <arch carsten-teibes.de>

pkgname=mbedtls-dtls
pkgver=3.5.0
pkgrel=1
pkgdesc='An open source, portable, easy to use, readable and flexible TLS library (with DTLS support)'
arch=(x86_64)
url=https://tls.mbed.org
license=(Apache)
depends=(
  glibc
  sh
)
checkdepends=(python)
makedepends=(
  cmake
  git
  ninja
  python
)
provides=(
  libmbedcrypto.so
  libmbedtls.so
  libmbedx509.so
  polarssl
)
replaces=(polarssl)
conflicts=(polarssl)
options=(staticlibs)
_tag=1ec69067fa1351427f904362c1221b31538c8b57
source=(git+https://github.com/ARMmbed/mbedtls.git#tag=${_tag})
b2sums=(SKIP)

prepare() {
  cd mbedtls
  scripts/config.py set MBEDTLS_THREADING_C
  scripts/config.py set MBEDTLS_THREADING_PTHREAD
  scripts/config.py set MBEDTLS_SSL_DTLS_SRTP
}

pkgver() {
  cd mbedtls
  git describe --tags | sed 's/^v//; s/^mbedtls-//'
}

build() {
  export CFLAGS+=' -ffat-lto-objects'
  cmake -S mbedtls -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DUSE_SHARED_MBEDTLS_LIBRARY=ON \
    -DUSE_STATIC_MBEDTLS_LIBRARY=ON \
    -Wno-dev
  cmake --build build
}

check() {
  LD_LIBRARY_PATH="${srcdir}"/build/library ctest --test-dir build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  # rename generic utils
  local _prog _baseprog
  for _prog in "${pkgdir}"/usr/bin/*; do
  _baseprog=$(basename "$_prog")
    mv -v "$_prog" "${_prog//$_baseprog/mbedtls_$_baseprog}"
  done

  # fixup static lib permissions
  chmod 644 "$pkgdir"/usr/lib/*.a
}

# vim: ts=2 sw=2 et:
