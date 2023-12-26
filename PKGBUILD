# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=zvbi-git
pkgver=0.2.42.r0.g3785481
pkgrel=1
pkgdesc="Library to capture and decode VBI data"
arch=('i686' 'x86_64')
url="https://github.com/zapping-vbi/zvbi"
license=('BSD' 'GPL2' 'LGPL2.1' 'MIT')
depends=('gcc-libs' 'libpng' 'libx11')
makedepends=('git')
provides=("zvbi=$pkgver")
conflicts=('zvbi')
options=('staticlibs')
source=("git+https://github.com/zapping-vbi/zvbi.git")
sha256sums=('SKIP')


pkgver() {
  cd "zvbi"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "zvbi"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin"
  make
}

check() {
  cd "zvbi"

  #make check
}

package() {
  cd "zvbi"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING.md" -t "$pkgdir/usr/share/licenses/zvbi"
}
