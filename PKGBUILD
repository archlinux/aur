# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=checkpwn-rs
pkgver=0.6.3
pkgrel=1
pkgdesc="Check Have I Been Pwned for breached accounts and passwords"
arch=('x86_64' 'aarch64')
url="https://github.com/brycx/checkpwn"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('77e1b33240919fe6a8f334e86b795c792029a3a1e16fbd37276445407be05f21')

prepare() {
  cd "checkpwn-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "checkpwn-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "checkpwn-${pkgver}"
  install -Dm755 "target/release/checkpwn" "${pkgdir}/usr/bin/checkpwn"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
