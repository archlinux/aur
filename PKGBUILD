# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=hsh
pkgver=0.0.3.1.g3fe7054
_gitcommit=3fe7054e28d634ef853bfe7a0c1f42785e46db46
pkgrel=2
pkgdesc="better shell"
arch=('x86_64')
url="https://github.com/GrayHatter/hsh"
license=('BSD-2-Clause')
# https://github.com/GrayHatter/hsh/issues/8
makedepends=('zig0.14' 'git')
source=(
  "${pkgname}::git+$url#commit=$_gitcommit"
)
sha256sums=('9294bcef69eba48fcabe21a89eafbefba80f1d259268678922c4efd98b7e772b')

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
