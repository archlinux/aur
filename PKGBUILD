# Maintainer: Friendships666 <tianfs6x6@gmail.com>
pkgname=justaiagent
pkgver=0.1.1
pkgrel=1
pkgdesc="Linux-native local AI agent with embedded web interface"
arch=('x86_64' 'aarch64')
url="https://github.com/Friendships6666/JustAIAgent"
license=('MIT')
depends=('curl' 'traceroute' 'iputils')
makedepends=('rust' 'cargo' 'nodejs' 'npm' 'cmake')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cf0d6129f2d4ebb01a569454c94edf5857610a87ba2e211f2a8c87ebf4a90b8a')

prepare() {
  cd "${srcdir}/JustAIAgent-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  npm --prefix web ci
}

build() {
  cd "${srcdir}/JustAIAgent-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  npm --prefix web run build
  cargo build --frozen --release
}

package() {
  cd "${srcdir}/JustAIAgent-${pkgver}"
  install -Dm755 target/release/justaiagent "${pkgdir}/usr/bin/justaiagent"
  ln -s justaiagent "${pkgdir}/usr/bin/jja"
}
