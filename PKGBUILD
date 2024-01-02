# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=mtdev-git
pkgver=1.1.6.r1.g2ed588e
pkgrel=1
pkgdesc="A stand-alone library which transforms all variants of kernel MT events to the slotted type B protocol"
arch=('i686' 'x86_64')
url="https://bitmath.org/code/mtdev/"
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=("mtdev=$pkgver")
conflicts=('mtdev')
options=('staticlibs')
source=("git+https://bitmath.org/git/mtdev.git")
sha256sums=('SKIP')


pkgver() {
  cd "mtdev"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "mtdev"

  ./autogen.sh
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "mtdev"

  make check
}

package() {
  cd "mtdev"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/mtdev"
}
