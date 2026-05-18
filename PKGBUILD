# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_pkgname=linear-cli
pkgname=linear-cli-finesssee
pkgver=0.3.25
pkgrel=1
pkgdesc="A powerful CLI for Linear.app built with Rust (by Finesssee)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Finesssee/linear-cli"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Finesssee/linear-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7b5f3d4907d519adfd8c93df07c9790afbbd5fa4addd6709f881d38160b89d9b')

prepare() {
  cd "${_pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${_pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "${_pkgname}-${pkgver}"
  
  # Install binary
  install -Dm755 "target/release/${_pkgname}" -t "${pkgdir}/usr/bin/"
  
  # Install documentation and license
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
