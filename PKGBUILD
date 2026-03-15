# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=hsh
pkgver=0.0.3.31.gffa3c16
_gitcommit=ffa3c16c02e3efc47108da6a2c88cb38ec52631b
pkgrel=1
pkgdesc="better shell"
arch=('x86_64')
url="https://github.com/GrayHatter/hsh"
license=('BSD-2-Clause')
makedepends=('zig' 'git')
source=(
  "${pkgname}::git+$url#commit=$_gitcommit"
)
sha256sums=('e415c898f7f12d222218bc93834cb4fcd88d9c27b59034219ada98ca6ec62e70')

pkgver() {
  cd "$pkgname"
  git describe --always --tags | sed 's|-|.|g' | cut -f2 -d"v"
}

build() {
  cd "$pkgname"
  DESTDIR="build" zig build \
    --prefix /usr \
    --search-prefix /usr \
    -Dtarget=native-linux.6.6-gnu.2.40 \
    -Dcpu=baseline
}
# https://github.com/GrayHatter/hsh/issues/8
# https://github.com/GrayHatter/hsh/issues/7
_check() {
  cd "$pkgname"
  zig build test \
    -Dtarget=native-linux.6.6-gnu.2.40 \
    -Dcpu=baseline
}

package() {
  cd "$pkgname"
  cp -a build/* "$pkgdir"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}
