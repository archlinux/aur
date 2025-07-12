# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cargo-nextest-git
pkgver=0.9.101.r5.g1fa7dd96
pkgrel=1
pkgdesc="A next-generation test runner for Rust."
arch=('x86_64')
url="https://github.com/nextest-rs/nextest"
license=('Apache-2.0' 'MIT')
depends=('cargo' 'gcc-libs')
makedepends=('git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}")
sha512sums=('SKIP')
options=('!lto')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^cargo-nextest-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mv "nextest" "${pkgname%-git}"
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen --package "${pkgname%-git}" --no-default-features --features default-no-update
}

check() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo run --package cargo-nextest -- nextest run -- --skip test_version_info
}

package() {
  cd "${pkgname%-git}"
  install -Dm 755 "target/release/${pkgname%-git}" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
