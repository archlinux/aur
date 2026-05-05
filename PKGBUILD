# Maintainer: zwielichtig <zwielichtig@users.noreply.github.com>
pkgname=zorg
pkgver=1.5.0
pkgrel=1
pkgdesc='A TUI SSH connection manager and orchestrator'
arch=('x86_64')
url='https://github.com/Zwielichtig/zorg'
license=('GPL-3.0-only')
makedepends=('cargo')
depends=('gcc-libs' 'glibc')
provides=('zorg')
conflicts=('zorg-bin')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/Zwielichtig/zorg/archive/refs/tags/zorg-v${pkgver}.tar.gz"
)
b2sums=(
  'f34aa25e693990504fa7d2def67681d0db1aca2f70047e6911bfc7e91155bc28e606be014a1620079fbb3da604bc87522ced435565bc4bc020b7f37fa32061a8'
)

prepare() {
  cd "zorg-zorg-v${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "zorg-zorg-v${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "zorg-zorg-v${pkgver}"
  install -Dm0755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
