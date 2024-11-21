# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=casey
_pkgname=filepack
pkgname=${_pkgname}
pkgver=0.0.6
pkgrel=1
pkgdesc='Command-line file hashing and verification utility written in Rust'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"
arch=('x86_64')
license=('custom:CC0')
depends=('glibc')
makedepends=('cargo' 'help2man' 'libgit2' 'libssh2')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('c4bbaf85629c3a21421668cb7b9c7a009085addc90a7e2a5e88531d359c35d10')

prepare() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build --release --frozen
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -Dm 755 "target/release/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"

  # license
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  # docs
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 DESIGN.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname"
}

check() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable

  cargo test --frozen --all
}
