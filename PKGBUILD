# Maintainer: Samueru-sama xdglawyer@outlook.com

pkgname=glycin-ng
pkgver=0.2.0
pkgrel=1
pkgdesc="In-process image decoder without bwrap dependency or useless bloat"
arch=('x86_64' 'aarch64')
url=https://github.com/QaidVoid/glycin-ng
license=('MIT' 'Apache-2.0')
depends=('glibc')
makedepends=('cargo' 'rust' 'git')
provides=('glycin')
conflicts=('glycin')
replaces=('glycin')
source=("$pkgname::git+https://github.com/QaidVoid/glycin-ng.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir"/"$pkgname"
  cargo build --release -p glycin-ng-c
  cargo build --release -p glycin-ng-libglycin-shim
}

package() {
  cd "$srcdir"/"$pkgname"
  install -Dm755 ./target/release/libglycin_ng.so \
    "$pkgdir"/usr/lib/libglycin_ng.so
  install -Dm755 ./target/release/libglycin_2.so \
    "$pkgdir"/usr/lib/libglycin-2.so.0
  install -Dm644 ./include/glycin_ng.h \
    "$pkgdir"/usr/include/glycin-ng/glycin_ng.h

  install -d "$pkgdir"/usr/lib/pkgconfig
  sed -e "s|@PREFIX@|/usr|g" \
      -e "s|@VERSION@|$pkgver|g" \
      -e "s|@PROJECT_NAME@|glycin-ng|g" \
    ./pkgconfig/glycin-ng.pc.in \
    > "$pkgdir"/usr/lib/pkgconfig/glycin-ng.pc

  sed -e "s|@PREFIX@|/usr|g" \
      -e "s|@VERSION@|2.1.1|g" \
      -e "s|@PROJECT_NAME@|glycin-2|g" \
    ./pkgconfig/glycin-ng.pc.in \
    > "$pkgdir"/usr/lib/pkgconfig/glycin-2.pc
}
