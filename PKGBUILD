# Maintainer: Ranieri Althoff <ranisalt+aur at gmail dot com>
# Contributor: Sébastien Luttringer

_pkgname=lz4
pkgname=${_pkgname}-static-musl
epoch=1
pkgver=1.9.1
pkgrel=2
pkgdesc='Extremely fast compression algorithm, statically linked to musl libc'
arch=('x86_64')
url='http://www.lz4.org/'
license=('GPL2')
makedepends=('git' 'musl')
checkdepends=('diffutils')
provides=("${_pkgname}=${pkgver}")
conflicts=('lz4')
source=("git+https://github.com/lz4/lz4.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
  export CC="musl-gcc"
  export CFLAGS="$CFLAGS -fPIC -static"

  # do not use the main makefile, it calls sub make with -e
  # exported CLFAGS by makepkg break the version. see FS#50071
  cd $_pkgname
  make -C lib PREFIX=/usr
  make -C programs PREFIX=/usr lz4 lz4c
}

check() {
  rm -f passwd.lz4
  $_pkgname/programs/lz4 /etc/passwd passwd.lz4
  $_pkgname/programs/lz4 -d passwd.lz4 passwd
  diff -q /etc/passwd passwd
  rm passwd
}

package() {
  cd $_pkgname
  make install PREFIX=/usr DESTDIR="$pkgdir"
}

# vim:set ts=2 sw=2 et:
