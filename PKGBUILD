# Maintainer: Samueru-sama xdglawyer@outlook.com

pkgname=glycin-ng
pkgver=0.3.1
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
source=("$pkgname::git+https://github.com/QaidVoid/glycin-ng.git#tag=$pkgver"
        "glycin-2-header::https://raw.githubusercontent.com/GNOME/glycin/80463391d9e8f3f136f48e5fd6a63c0bf116e884/libglycin/include/glycin.h")
sha256sums=('SKIP'
            'SKIP')

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
  install -Dm644 "$srcdir"/glycin-2-header \
    "$pkgdir"/usr/include/glycin-2/glycin.h

  install -d "$pkgdir"/usr/lib/pkgconfig
  sed -e "s|@PREFIX@|/usr|g" \
      -e "s|@VERSION@|$pkgver|g" \
    ./pkgconfig/glycin-ng.pc.in \
    > "$pkgdir"/usr/lib/pkgconfig/glycin-ng.pc

  sed -e "s|@PREFIX@|/usr|g" \
      -e "s|@VERSION@|2.1.1|g" \
    ./pkgconfig/glycin-2.pc.in \
    > "$pkgdir"/usr/lib/pkgconfig/glycin-2.pc
}
