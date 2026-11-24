# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=buffrs
pkgver=0.13.3
pkgrel=1
pkgdesc="Package manager for Protocol Buffers"
arch=('x86_64' 'aarch64')
url="https://github.com/helsing-ai/buffrs"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a073cbe7c3f2e059caf9fda3f33716b28481d4493e4adb8fe971d0fa1bdbb65b')

prepare() {
  cd "buffrs-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "buffrs-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "buffrs-${pkgver}"
  install -Dm755 "target/release/buffrs" "${pkgdir}/usr/bin/buffrs"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
