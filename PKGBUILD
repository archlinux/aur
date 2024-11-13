# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=ringfairy
pkgver=0.1.3
pkgrel=1
pkgdesc="Static webring generator."
arch=('x86_64')
url="https://github.com/k3rs3d/ringfairy"
license=('GPL-3.0-only')
makedepends=('cargo')
source=("$pkgname-$pkgver-alpha.tar.gz::https://github.com/k3rs3d/$pkgname/archive/refs/tags/v$pkgver-alpha.tar.gz"
        "ringfairy.toml")
sha256sums=('38b6777000fa49f627dc3b126d392863c0c2293ce0138f2d748864fbd3a3ef9c'
            'fcccc35d4d63489b7ed7dd856b8f03a7fe709976c59c05d3b7d2ab474ff3da32')

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$pkgname-$pkgver-alpha"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$pkgname-$pkgver-alpha"
  cargo build --frozen --release --all-features
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$pkgname-$pkgver-alpha"
  cargo test --frozen --all-features
}

package() {
  install -dm755 "$pkgdir/etc/$pkgname"
  install -dm755 "$pkgdir/usr/share/$pkgname"
  install -dm755 "$pkgdir/usr/share/defaults/$pkgname"

  install -Dm755 -t "$pkgdir/etc/$pkgname" "ringfairy.toml"

  cd "$pkgname-$pkgver-alpha"
  cp -r "data/templates" "$pkgdir/usr/share/$pkgname/"
  cp -r "data/assets" "$pkgdir/usr/share/$pkgname/"
  install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm755 -t "$pkgdir/usr/share/defaults/$pkgname" "websites.json"
  install -Dm755 -t "$pkgdir/usr/share/defaults/$pkgname" "ringfairy.toml"
}

# vim:set ts=2 sw=2 et:
