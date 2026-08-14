# Maintainer: dllud <dllud riseup net>

pkgname=grin-wallet
pkgver=5.5.0
pkgrel=1
pkgdesc="Reference implementation of Grin's wallet."
arch=('i686' 'x86_64')
url='https://github.com/mimblewimble/grin-wallet'
license=('Apache-2.0')
optdepends=('tor: for immediate transactions through Tor anonymizing network')
makedepends=('cargo')
source=("${pkgname}::git+https://github.com/mimblewimble/grin-wallet.git#tag=v${pkgver}")
sha256sums=('SKIP')
options=(!lto)

prepare() {
  cd ${pkgname}
  git submodule update --init --recursive
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd ${pkgname}
  cargo build --frozen --release --all-features
}

check() {
  cd ${pkgname}
  cargo test --frozen --all-features
}

package() {
  cd ${pkgname}
  install -Dm755 -t "${pkgdir}/usr/bin" target/release/grin-wallet
}
