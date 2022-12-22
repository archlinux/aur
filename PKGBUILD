# Maintainer: Oliver Nordbjerg <hi@notbjerg.me>
_pkgname=foundry
pkgname=foundry-git
pkgver=r1965.f10df79e8
pkgrel=1
pkgdesc="A blazing fast, portable and modular toolkit for Ethereum application development written in Rust."
arch=('x86_64' 'aarch64')
url="https://getfoundry.sh"
license=('APACHE' 'MIT')
depends=(gcc-libs libusb openssl)
makedepends=('git' 'cargo')
provides=(forge cast anvil)
source=("git+https://github.com/foundry-rs/foundry")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$_pkgname"
  find target/release \
    -maxdepth 1 \
    -executable \
    -type f \
    -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
  # TODO completions
  # TODO doc

  install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
