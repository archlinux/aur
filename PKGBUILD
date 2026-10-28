# Maintainer: killab33z <killab33z @ hispagatos-dot-org>
pkgname=usenet_reborn
pkgver=1.0.0
pkgrel=1
pkgdesc="A terminal‑based (TUI) NNTP (Usenet) client written in Rust."
arch=('any')
url="https://git.sr.ht/~rek2/usenet_reborn"
license=(GPL-3.0-only)
makedepends=('cargo')
source=("$url/archive/$pkgver.tar.gz")
sha512sums=('588a841ce30cdbdcfd36ddb045092f8c61577ba3e31642394ee8f96ab5f2dcdd8a21c2ebe19ba26deab6d106999b4abace75761c5556a497dac6b45ef11829ab')
options=(!debug !lto)

# https://wiki.archlinux.org/title/Rust_package_guidelines
prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 -t "$pkgdir/usr/share/$pkgname" configs/config.toml
  install -Dm644 -t "$pkgdir/usr/share/$pkgname" configs/subscriptions
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname" README.md
}

