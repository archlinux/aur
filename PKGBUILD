# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gdbm-git
pkgver=1.23.r21.gcbbf1d7
pkgrel=1
pkgdesc="GNU database library"
arch=('i686' 'x86_64')
url="https://www.gnu.org.ua/software/gdbm/gdbm.html"
license=('GPL-3.0-or-later')
depends=('glibc' 'sh')
makedepends=('git' 'readline' 'rsync')
provides=("gdbm=$pkgver" 'libgdbm.so' 'libgdbm_compat.so')
conflicts=('gdbm')
options=('staticlibs')
source=("git+https://git.gnu.org.ua/gdbm.git")
sha256sums=('SKIP')


pkgver() {
  cd "gdbm"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "gdbm"

  ./bootstrap
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  ./configure \
    --prefix="/usr" \
    --enable-libgdbm-compat
  make
}

check() {
  cd "gdbm"

  #make check
}

package() {
  cd "gdbm"

  make DESTDIR="$pkgdir" install
  install -Dm644 {AUTHORS,NEWS,NOTE-WARNING,README} -t "$pkgdir/usr/share/doc/gdbm"
}
