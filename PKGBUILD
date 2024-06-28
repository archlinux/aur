# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=hsh
pkgver=0.0.2.97.g38846e6
_gitcommit=38846e68eba7a77cce2ae88e7c1ba1741546debf
pkgrel=3
pkgdesc="better shell"
arch=('x86_64')
url="https://github.com/GrayHatter/hsh"
license=('BSD-2-Clause')
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
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}
