# Maintainer: killab33z <killab33z @ hispagatos-dot-org>
pkgname=usenet_reborn
pkgver=0.2.2
pkgrel=2
pkgdesc="A terminal‑based (TUI) NNTP (Usenet) client written in Rust."
arch=('any')
url="https://git.sr.ht/~rek2/usenet_reborn"
license=(GPL-3.0-only)
makedepends=('cargo')
source=("$url/archive/$pkgver.tar.gz")
sha512sums=('5dd51b2c3667e141172dacd8d78728d8cbd24385a58f1afbbc8d8a9e475c41297f2c4ec4176449121ca9311ef72f0f89f9a36422eb98d8fb709bdab9c31e2057')
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

