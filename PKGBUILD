# Maintainer: killab33z <killab33z @ hispagatos-dot-org>
pkgname=usenet_reborn
pkgver=0.2.0
pkgrel=1
pkgdesc="A terminal‑based (TUI) NNTP (Usenet) client written in Rust."
arch=('any')
url="https://git.sr.ht/~rek2/usenet_reborn"
license=(GPL-3.0-only)
makedepends=('cargo')
source=("$url/archive/$pkgver.tar.gz")
sha512sums=('2b7f0b376815048c2244a2a61b5492c7eeefe98ee782db58cabdd4424208eeb49eca6bce71029d60a8268ff25ceabded69d82964b197e3a7d690624834df156d')
options=(!debug !lto)

# https://wiki.archlinux.org/title/Rust_package_guidelines
prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
}

