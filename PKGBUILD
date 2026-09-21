# Maintainer: Thomas Peklak <thomaspeklak@gmail.com>
pkgname=agent-sandbox
pkgver=0.23.0
pkgrel=1
pkgdesc='Launch AI coding agents inside a rootless Podman sandbox'
arch=('x86_64')
url='https://github.com/thomaspeklak/agent-sandbox'
license=('MIT')
install='agent-sandbox.install'
depends=('git' 'openssh' 'podman')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1089725ae05fbdb0b846b360837b92e0b29eed7582dbd567f2420fc5232911fb')

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
