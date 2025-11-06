# Maintainer: Kemel Zaidan <kemelzaidan at gmail dot com>
pkgname=tatuin
pkgver=0.25.0
pkgrel=2
pkgdesc="Task Aggregator TUI for Obsidian, Todoist, Gitlab TODO and Github Issues"
arch=("i686" "x86_64" "aarch64")
license=("MIT")
url="https://github.com/panter-dsd/tatuin"
makedepends=('rust' 'cargo' 'openssl' 'pkgconf')
depends=('glibc' 'gcc-libs' 'openssl')
source=("${url}/archive/refs/tags/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('245da2d1ec6aae88229596d8ed48a20857c1d2813731e68dd2755669cb892213')

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  export OPENSSL_NO_VENDOR=1
  export OPENSSL_DIR="/usr"
  export OPENSSL_LIB_DIR="/usr/lib"
  export OPENSSL_INCLUDE_DIR="/usr/include"
  export PKG_CONFIG_ALLOW_CROSS=1
  export PKG_CONFIG_PATH="/usr/lib/pkgconfig"
  export LIBRARY_PATH="/usr/lib"

  export RUSTFLAGS="-C link-args=-lssl -C link-args=-lcrypto"

  cd "${pkgname}-${pkgver}"
  cargo build --frozen --release --all-features
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  cd "${pkgname}-${pkgver}"
  cargo test --frozen --all-features
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
  install -Dm655 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
