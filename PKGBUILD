# Maintainer: Orhun Parmaksız <orhun@archlinux.org>

pkgname=rathole
pkgver=0.3.1
pkgrel=1
pkgdesc="A reverse proxy for NAT traversal"
arch=('x86_64')
url="https://github.com/rapiz1/rathole"
license=('Apache')
depends=('gcc-libs' 'openssl')
makedepends=('rust' 'libgit2')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname-$pkgver-vergen.patch::$url/commit/bb26e2cd36bf63dd6b49000bb57a94761e0e82b1.patch")
sha256sums=('48ddabbceb1e98113ab3b7cf75c9e6b2e1b0e49265192da442b43ad91f97af4f'
            'f93263bae8b782fabc1d730f564e3455d35d14c960c39f23d73b1f6f24249f6e')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i "../$pkgname-$pkgver-vergen.patch"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim:set ts=2 sw=2 et:
