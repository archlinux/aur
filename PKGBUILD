# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Former maintainer: Anton Kudryavtsev <boblobl4@gmail.com>

pkgname=mbedtls-git
pkgver=3.2.1.r1520.g69ae1ee4f
pkgrel=1
pkgdesc="An open source, portable, easy to use, readable and flexible SSL library"
arch=('i686' 'x86_64')
url="https://www.trustedfirmware.org/projects/mbed-tls/"
license=('apache')
depends=('glibc')
makedepends=('git' 'perl' 'python-jinja' 'python-jsonschema')
checkdepends=('python')
provides=("mbedtls=$pkgver" 'polarssl' 'libmbedcrypto.so' 'libmbedtls.so' 'libmbedx509.so')
conflicts=('mbedtls' 'polarssl')
options=('staticlibs')
source=("git+https://github.com/Mbed-TLS/mbedtls.git")
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
