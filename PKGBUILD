# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=lz4-static
_pkgname="${pkgname%-static}"
epoch=1
pkgver=1.8.2
pkgrel=1
pkgdesc='Extremely fast compression algorithm (static version)'
arch=('i686' 'x86_64')
url='http://www.lz4.org/'
license=('GPL2')
checkdepends=('diffutils')
depends=('glibc')
source=("https://github.com/lz4/lz4/archive/v$pkgver.tar.gz")
sha256sums=('0963fbe9ee90acd1d15e9f09e826eaaf8ea0312e854803caf2db0a6dd40f4464')
options=('staticlibs')
provides=('lz4')
conflicts=('lz4')

build() {
  # do not use the main makefile, it calls sub make with -e
  # exported CLFAGS by makepkg break the version. see FS#50071
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
