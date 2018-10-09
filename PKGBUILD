# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=lz4-static
_pkgname="${pkgname%-static}"
epoch=1
pkgver=1.8.3
pkgrel=1
pkgdesc='Extremely fast compression algorithm (static version)'
arch=('x86_64')
url='http://www.lz4.org/'
license=('GPL2')
checkdepends=('diffutils')
depends=('glibc')
source=("https://github.com/lz4/lz4/archive/v$pkgver.tar.gz")
sha256sums=('33af5936ac06536805f9745e0b6d61da606a1f8b4cc5c04dd3cbaca3b9b4fc43')
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
