# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=cargo-semver-checks
pkgver=0.18.1
pkgrel=1
pkgdesc='Scan your Rust crate for semver violations'
url='https://github.com/obi1kenobi/cargo-semver-checks'
license=('Apache' 'MIT')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('libgit2' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/obi1kenobi/cargo-semver-checks/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4ec066e2446708b3632761207d73949b7361debd4d7bb3c844dfa91ae31e0c0a')
b2sums=('71d5f7e2c3aab09485bc6d900bee1bc4eee9ee81a0bd6ca24e9bde292fa0e765b8122482b9e19b15ccc9b778ac26be7eda6a807385f08a7e4361a06a42ab4b60')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

case $CARCH in
  x86_64|i686|aarch64)
    _target="$CARCH-unknown-linux-gnu" ;;
  arm)
    _target="arm-unknown-linux-gnueabi" ;;
esac

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target $_target
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release --no-default-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    target/release/cargo-semver-checks

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-{APACHE,MIT}
}
