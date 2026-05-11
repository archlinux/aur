# Maintainer: Thomas Peklak <thomaspeklak@gmail.com>
pkgname=agent-sandbox
pkgver=0.12.0
pkgrel=1
pkgdesc='Launch AI coding agents inside a rootless Podman sandbox'
arch=('x86_64')
url='https://github.com/thomaspeklak/agent-sandbox'
license=('MIT')
install='agent-sandbox.install'
depends=('git' 'openssh' 'podman')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9da9381684271478ff9121fee1d4644e7f9450c23d6f090701158b44f7bb6908')

prepare() {
  cd "agent-sandbox-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "agent-sandbox-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p ags --bin ags
}

package() {
  cd "agent-sandbox-${pkgver}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/ags"
}
