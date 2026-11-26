# Maintainer: Friendships666 <tianfs6x6@gmail.com>
pkgname=celoom
pkgver=0.1.4
pkgrel=1
pkgdesc="Celoom (细胞绽放) — Linux-native local AI agent with embedded web interface"
arch=('x86_64' 'aarch64')
url="https://github.com/Friendships6666/Celoom"
license=('MIT')
depends=('curl' 'traceroute' 'iputils')
makedepends=('rust' 'cargo' 'nodejs' 'npm' 'cmake' 'clang' 'lld')
provides=('justaiagent')
conflicts=('justaiagent')
replaces=('justaiagent')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('82386c28009993dc95c1191c6c7fcef48b66036c33ced08995c54ee3b3b131e6')

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
