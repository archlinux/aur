# Maintainer: Friendships666 <tianfs6x6@gmail.com>
pkgname=celoom
pkgver=0.1.2
pkgrel=1
pkgdesc="Celoom (细胞绽放) — Linux-native local AI agent with embedded web interface"
arch=('x86_64' 'aarch64')
url="https://github.com/Friendships6666/Celoom"
license=('MIT')
depends=('curl' 'traceroute' 'iputils')
makedepends=('rust' 'cargo' 'nodejs' 'npm' 'cmake')
provides=('justaiagent')
conflicts=('justaiagent')
replaces=('justaiagent')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6d806391fb6ca0bd5ad364ae5289065ac931124a7be8b7dba69e4c973ab62655')

prepare() {
  cd "${srcdir}/Celoom-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  npm --prefix web ci
}

build() {
  cd "${srcdir}/Celoom-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  npm --prefix web run build
  cargo build --frozen --release
}

package() {
  cd "${srcdir}/Celoom-${pkgver}"
  install -Dm755 target/release/celoom "${pkgdir}/usr/bin/celoom"
  ln -s celoom "${pkgdir}/usr/bin/cel"
}
