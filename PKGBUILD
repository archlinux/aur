# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=s2n-git
pkgver=r442.674df33
_libressl_ver=2.3.1
pkgrel=1
pkgdesc='Implementation of the TLS/SSL protocols that is designed to be simple, small, fast, and with security as a priority'
arch=(i686 x86_64)
url='https://github.com/awslabs/s2n'
license=(Apache)
#depends=(glibc)
makedepends=(git)
source=(git://github.com/awslabs/s2n
       http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-$_libressl_ver.tar.gz)
sha1sums=('SKIP'
          '37c765c6a452e1dd6c5ed368d618c05e5875715e')

pkgver() {
  cd s2n
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd s2n
  # https://github.com/awslabs/s2n/issues/99
  find . -type f -exec sed -i 's/lpthread/pthread/' '{}' \;
}

build() {
  cd s2n

  cd libcrypto-build
  tar -xzvf "$srcdir"/libressl-$_libressl_ver.tar.gz
  cd libressl-$_libressl_ver
  ./configure --prefix=`pwd`/../../libcrypto-root/
  make CFLAGS=-fPIC install

  cd ../..

  make bin libs
}

check() {
  cd s2n
  make -C tests
}

package() {
  cd s2n

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

