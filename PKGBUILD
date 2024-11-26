# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=hsh
pkgver=0.0.2.100.g34f4f13
_gitcommit=34f4f13eb4388a33538221cff4f40f935e401f5d
pkgrel=1
pkgdesc="better shell"
arch=('x86_64')
url="https://github.com/GrayHatter/hsh"
license=('BSD-2-Clause')
makedepends=('zig' 'git')
source=(
  "${pkgname}::git+$url#commit=$_gitcommit"
https://patch-diff.githubusercontent.com/raw/GrayHatter/hsh/pull/6.patch
)
sha256sums=('c137ec670c6c52ac462db2ed7460a347254563de34753e9015b92f3de37fa047'
            '43ac8906cd952da0a8e669969b62ef2512a2ab45d9714dd3604d26c36f29374f')

pkgver() {
  cd "$pkgname"
  git describe --always | sed 's|-|.|g' | cut -f2 -d"v"
}

prepare() {
  cd "$pkgname"
  patch -p1 -i ../6.patch
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
