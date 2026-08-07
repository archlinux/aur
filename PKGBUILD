# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=protonup-rs
pkgver=0.14.0
pkgrel=2
pkgdesc="Automate the installation and update of Linux Gaming Compatibility tools"
arch=('x86_64')
url="https://github.com/auyer/Protonup-rs"
license=('Apache-2.0')
depends=(
  'glibc'
  'xz'
  'zstd'
)
makedepends=('cargo')
source=("Protonup-rs-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('08314f72e071475680de0ee90e82a5b94b5333849f02c741a9208e18bdcdff75')

prepare() {
  cd "Protonup-rs-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "Protonup-rs-$pkgver"
  CFLAGS+=" -ffat-lto-objects"
  export ZSTD_SYS_USE_PKG_CONFIG=1
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "Protonup-rs-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "$pkgname/man/$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 "$pkgname/completions/$pkgname.bash" \
    "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 "$pkgname/completions/$pkgname.fish" -t  \
    "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm644 "$pkgname/completions/_${pkgname}" -t  \
    "$pkgdir/usr/share/zsh/site-functions/"
}
