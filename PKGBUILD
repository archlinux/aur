# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=dislocker
pkgver=0.4.1
pkgrel=1
pkgdesc="Read BitLocker encrypted volumes under Linux"
arch=('i686' 'x86_64')
url="http://www.hsc.fr/ressources/outils/dislocker"
license=('GPL2')
depends=('fuse' 'mbedtls')
conflicts=('dislocker-git')
optdepends=('ntfs-3g: NTFS file system support')
source=(https://github.com/Aorimn/dislocker/archive/v$pkgver.tar.gz)
md5sums=('f8983383a65ca7e82cf246d978dc2c3f')

build() {
  cd "$pkgname-$pkgver/src"
	sed -i 's|polarssl|mbedtls|g' Makefile
	sed -i 's|polarssl|mbedtls|g' encommon.h
	sed -i 's|polarssl|mbedtls|g;s|sha2.h|sha256.h|' accesses/stretch_key.h
	sed -i 's|polarssl|mbedtls|g' ssl_bindings.h
	sed -i '30i#include "mbedtls/compat-1.3.h"' ssl_bindings.h
  make all
}

package() {
  cd "$pkgname-$pkgver/src"
  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/lib" "$pkgdir/usr/share/man/man1"
  make DESTDIR="$pkgdir/usr" install
}
