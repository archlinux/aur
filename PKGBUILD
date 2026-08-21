# Maintainer: Aetf <aetf at unlimited-code dot works>
pkgname=chored
pkgver=0.1.0
pkgrel=1
pkgdesc="Run declared, sandboxed jobs on a host over forced-command SSH"
arch=('x86_64' 'aarch64')
url="https://github.com/Aetf/chored"
license=('MIT OR Apache-2.0')
depends=('gcc-libs' 'glibc' 'systemd')
makedepends=('cargo')
optdepends=('podman: run container image jobs'
            'openssh: SSH entry point and setup key generation')
# Disable lto as it breaks rust -sys crates (undefined references when linking)
# See also https://github.com/Canop/broot/issues/852
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('b396039ab853c1fb4369542c7e41c58b2de9fd0ea8bdb0962172bceb1f8c3d419f453684fff6c65a61a575811532c242c03aa97a6063839b1b8488678dca78c3')

prepare() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable

  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin"

  install -Dm0644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm0644 LICENSE-MIT LICENSE-APACHE -t "$pkgdir/usr/share/licenses/$pkgname"
}
