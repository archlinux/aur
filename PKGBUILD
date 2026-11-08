# Maintainer: asalde_le1 <asalde.le1@gmail.com>

pkgname=antumbra
_pkgname=penumbra
pkgver=2.0.0
pkgrel=1
pkgdesc="TUI and CLI MTK flash tool for MediaTek based devices (Penumbra)"
arch=('x86_64' 'aarch64')
url="https://github.com/shomykohai/penumbra"
license=('AGPL-3.0-or-later')
depends=('glibc' 'libgcc' 'libusb' 'systemd-libs')
makedepends=('cargo' 'pkgconf')
# GCC LTO objects from ring's C code break linking with rust-lld
options=('!lto')
install="$pkgname.install"
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "70-antumbra.rules")
sha256sums=('89ec25b3df44b9da08398cf2bed7b3a4c1fd84d27a588b387420c12db30e8e80'
            '5cd831abf654c1a7b170677140b92381807e452e72d5ba6136d0f1c7e221a3c8')

prepare() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # penumbra-mtk uses #![feature(trait_alias)]
  export RUSTC_BOOTSTRAP=1
  cargo build --frozen --release --package antumbra
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 target/release/antumbra -t "$pkgdir/usr/bin/"
  install -Dm644 "$srcdir/70-antumbra.rules" -t "$pkgdir/usr/lib/udev/rules.d/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
