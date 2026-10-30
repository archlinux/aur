# Maintainer: killab33z <killab33z @ hispagatos-dot-org>
pkgname=usenet_reborn
pkgver=1.1.0
pkgrel=1
pkgdesc="A terminal‑based (TUI) NNTP (Usenet) client written in Rust."
arch=('any')
url="https://git.sr.ht/~rek2/usenet_reborn"
license=(GPL-3.0-only)
makedepends=('cargo')
source=("$url/archive/$pkgver.tar.gz")
sha512sums=('0fd87dfa3c6dbac4594701350424d807e73de7ea26dd7babbd31a71e0a15bedb190e2ab79966b680ba390681919fc9e10ed135b892757521466c5a3c42ab2af2')
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
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}

