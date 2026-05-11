# Maintainer: Thomas Peklak <thomaspeklak@gmail.com>
pkgname=agent-sandbox
pkgver=0.11.4
pkgrel=1
pkgdesc='Launch AI coding agents inside a rootless Podman sandbox'
arch=('x86_64')
url='https://github.com/thomaspeklak/agent-sandbox'
license=('MIT')
install='agent-sandbox.install'
depends=('git' 'openssh' 'podman')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('32368a7b9ceadc345e1db699830df5605fe6d99b61c53cdf870b4e9b17de489b')

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
