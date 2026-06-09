# Maintainer: Robin Marchart <robin.marchart at gmail dot com>
pkgname='jellyhaj'
pkgver=0.2.1
pkgrel=1
pkgdesc="Terminal client for Jellyfin reimplementing parts of the web ui"
arch=('x86_64' 'aarch64')
url="https://github.com/owo-uwu-nyaa/jellyhaj"
license=('MIT')
depends=('chafa' 'mpv' 'sqlite' 'dbus')
makedepends=('cargo' 'clang' 'git')
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/owo-uwu-nyaa/jellyhaj/archive/v${pkgver}.tar.gz")
sha256sums=('13f2a37ec1afe3ccf8fa12c2c20e88df9ca4f50d39630d0a20d3a97b0e01d273')

prepare() {
  cd "${pkgname}-${pkgver}" || exit
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${pkgname}-${pkgver}" || exit
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -F mpris
}

check() {
  cd "${pkgname}-${pkgver}" || exit
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release -F mpris --workspace
}

package() {
  cd "${pkgname}-${pkgver}" || exit
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/jellyhaj"
  install -Dm0644 -t "$pkgdir/usr/share/applications/" "jellyhaj.desktop"
  install -Dm644 License.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
