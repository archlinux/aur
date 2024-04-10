# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=hsh
pkgver=0.0.2.76.gd82ba32
_gitcommit=d82ba323ad46288f136038c53c843acaa9997e99
pkgrel=1
pkgdesc="better shell"
arch=('x86_64')
url="https://github.com/GrayHatter/hsh"
license=('unknown')
makedepends=('zig' 'git')
source=(
  "${pkgname}::git+$url#commit=$_gitcommit"
)
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --always | sed 's|-|.|g' | cut -f2 -d"v"
}

build() {
  cd "$pkgname"
  DESTDIR="build" zig build \
    --prefix /usr \
    --search-prefix /usr \
    -Dtarget=native-linux.5.15-gnu \
    -Dcpu=baseline
}

check() {
  cd "$pkgname"
  zig build test \
    -Dtarget=native-linux.5.15-gnu \
    -Dcpu=baseline
}

package() {
  cd "$pkgname"
  cp -a build/* "$pkgdir"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
