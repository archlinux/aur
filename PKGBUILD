# Maintainer: killab33z <killab33z @ hispagatos-dot-org>
pkgname=usenet_reborn
pkgver=2.0.0
pkgrel=1
pkgdesc="A terminal‑based (TUI) NNTP (Usenet) client written in Rust."
arch=('any')
url="https://git.sr.ht/~rek2/usenet_reborn"
license=(GPL-3.0-only)
makedepends=('cargo')
source=("$url/archive/$pkgver.tar.gz")
sha512sums=('cea74de978bf2f3a6d6acda2fbbf9afd65e2ff8c8038aa875d4e2ff69144317b4f0a9c23d29a3d5fe44263f10bc08d67b571ad531737c2d4fc35f6c26b2014c0')
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

