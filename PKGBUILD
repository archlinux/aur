# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=lz4-static
_pkgname="${pkgname%-static}"
pkgver=1.9.1
pkgrel=1
pkgdesc='Extremely fast compression algorithm (static version)'
arch=('x86_64')
url='http://www.lz4.org/'
license=('GPL2')
checkdepends=('diffutils')
depends=('glibc')
source=("https://github.com/lz4/lz4/archive/v$pkgver.tar.gz")
sha256sums=('f8377c89dad5c9f266edc0be9b73595296ecafd5bfa1000de148096c50052dc4')
options=('staticlibs')
provides=('lz4')
conflicts=('lz4')

build() {
  # do not use the main makefile, it calls sub make with -e
  # exported CFLAGS by makepkg break the version. see FS#50071
  cd $_pkgname-$pkgver
  make -C lib PREFIX=/usr CFLAGS="$CFLAGS -fPIC"
  make -C programs PREFIX=/usr lz4 lz4c
}

check() {
  rm -f passwd.lz4
  $_pkgname-$pkgver/programs/lz4 /etc/passwd passwd.lz4
  $_pkgname-$pkgver/programs/lz4 -d passwd.lz4 passwd
  diff -q /etc/passwd passwd
  rm passwd
}

package() {
  cd $_pkgname-$pkgver
  make install PREFIX=/usr DESTDIR="$pkgdir"
}

# vim:set ts=2 sw=2 et:
