# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Former maintainer: Anton Kudryavtsev <boblobl4@gmail.com>

pkgname=mbedtls-git
pkgver=3.1.0.r31.gd1d0b41fc
pkgrel=1
pkgdesc="An open source, portable, easy to use, readable and flexible SSL library"
arch=('i686' 'x86_64')
url="https://tls.mbed.org/"
license=('apache')
depends=('glibc')
makedepends=('git' 'perl' 'python-jinja')
checkdepends=('python')
provides=('mbedtls' 'polarssl' 'libmbedcrypto.so' 'libmbedtls.so' 'libmbedx509.so')
conflicts=('mbedtls' 'polarssl')
options=('staticlibs')
source=("git+https://github.com/ARMmbed/mbedtls.git")
sha256sums=('SKIP')


prepare() {
  cd "mbedtls"

  # enable flags for non-embedded systems
  sed -i 's|//\(#define MBEDTLS_THREADING_C\)|\1|' "include/mbedtls/mbedtls_config.h"
  sed -i 's|//\(#define MBEDTLS_THREADING_PTHREAD\)|\1|' "include/mbedtls/mbedtls_config.h"
}

pkgver() {
  cd "mbedtls"

  git describe --long --tags | sed 's/^mbedtls-//;s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "mbedtls"

  make SHARED=1 no_test
}

check() {
  cd "mbedtls"

  make SHARED=1 PYTHON="python" check
}

package() {
  cd "mbedtls"

  make DESTDIR="$pkgdir/usr" install
}
