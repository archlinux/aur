# Maintainer: Friendships666 <tianfs6x6@gmail.com>
pkgname=celoom
pkgver=0.1.3
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
sha256sums=('f533b7de7208ed7c75f9f467a58a227acb77e2e2d8f8d9ea5614198ad4317fae')

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
