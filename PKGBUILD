# Maintainer: Milkii Brewster <milkii on Freenode IRC>
maintaner="Milkii Brewster <milkii on Freenode IRC>"
_pkgname=poly.lv2
pkgname=$_pkgname-git
pkgdesc="A collection of LV2 plugins designed for modular / eurorack style use."
pkgver=r2.3fd1dd4
pkgrel=1
arch=(x86_64)
url="https://github.com/polyeffects/PolyLV2"
license=()
groups=('lv2plugins')
depends=('lv2')
makedepends=('git')
provides=('poly.lv2')
conflicts=('poly.lv2')
source=($pkgname::git+https://github.com/polyeffects/PolyLV2)
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$pkgname"
}

build() {
  cd "$pkgname"
  for d in */; do
    cd "$d" && make && cd ..
  done
}

package() {
  cd "$pkgname"
  for d in */; do
    cd "$d"
    find . -type 'f' | grep -v "build" | xargs rm
    cp -r build/* .
    rm -rf build
    cd ..
  done
  mkdir -p "$pkgdir/usr/lib/lv2/"
  cp -r * "$pkgdir/usr/lib/lv2/"
}
