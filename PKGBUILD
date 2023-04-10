# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=turbobench-git
pkgver=2023.04.r16.g753b2ab
pkgrel=1
pkgdesc="Compressor benchmark program"
arch=('i686' 'x86_64')
url="https://github.com/powturbo/TurboBench"
license=('GPL2')
depends=('gcc-libs')
makedepends=('git')
provides=("turbobench=$pkgver")
conflicts=('turbobench')
source=("git+https://github.com/powturbo/TurboBench.git")
sha256sums=('SKIP')


prepare() {
  cd "TurboBench"

  git submodule update --init --recursive
}

pkgver() {
  cd "TurboBench"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9-]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//;s/-/./g'
}

build() {
  cd "TurboBench"

  make
}

package() {
  cd "TurboBench"

  install -Dm755 "turbobench" -t "$pkgdir/usr/bin"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/turbobench"
}
