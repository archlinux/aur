# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=openlibm-git
pkgver=0.8.0.r0.ged7aea3
pkgrel=1
pkgdesc="A high quality, portable, standalone C mathematical library"
arch=('i686' 'x86_64')
url="https://openlibm.org/"
license=('custom')
depends=('glibc')
makedepends=('git')
provides=('openlibm')
conflicts=('openlibm')
options=('staticlibs')
source=("git+https://github.com/JuliaMath/openlibm.git")
sha256sums=('SKIP')


prepare() {
  cd "openlibm"

  sed -e 's|/usr/local|/usr|' -i "Make.inc"
}

pkgver() {
  cd "openlibm"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "openlibm"

  make prefix="/usr"
}

check() {
  cd "openlibm"

  make check
}

package() {
  cd "openlibm"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE.md" -t "$pkgdir/usr/share/licenses/openlibm"
}
