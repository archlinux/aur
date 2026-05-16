# Maintainer: Thomas Peklak <thomaspeklak@gmail.com>
pkgname=agent-sandbox
pkgver=0.13.0
pkgrel=1
pkgdesc='Launch AI coding agents inside a rootless Podman sandbox'
arch=('x86_64')
url='https://github.com/thomaspeklak/agent-sandbox'
license=('MIT')
install='agent-sandbox.install'
depends=('git' 'openssh' 'podman')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('13ec8f4cffdd63a227c2e23d3ba338e2caea8414e12213d720ae9de6c903d74f')

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
