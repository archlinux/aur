# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=checkpwn-rs
pkgver=0.6.4
pkgrel=1
pkgdesc="Check Have I Been Pwned for breached accounts and passwords"
arch=('x86_64' 'aarch64')
url="https://github.com/brycx/checkpwn"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4fcb2e44568a76af8dce753aad6761bc5bc71e9ca07223a200355d996323d013')

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
