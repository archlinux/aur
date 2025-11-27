# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lz4-git
pkgver=1.10.0.r216.g3c08d0d8
pkgrel=1
pkgdesc="Extremely Fast Compression algorithm"
arch=('i686' 'x86_64')
url="https://lz4.github.io/lz4/"
license=('BSD-2-Clause' 'GPL-2.0-or-later')
depends=('glibc')
makedepends=('git')
provides=("lz4=1:$pkgver" 'liblz4.so')
conflicts=('lz4')
options=('staticlibs')
source=("git+https://github.com/lz4/lz4.git")
sha256sums=('SKIP')


pkgver() {
  cd "lz4"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "lz4"

  CFLAGS="$CFLAGS -ffat-lto-objects" \
  CXXFLAGS="$CXXFLAGS -ffat-lto-objects" \
  make
}

check() {
  cd "lz4"

  #make test
}

package() {
  cd "lz4"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "lib/LICENSE" -t "$pkgdir/usr/share/licenses/lz4"
}
