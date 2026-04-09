# Maintainer: zeroclaw-bot <zeroclaw-bot@users.noreply.github.com>
pkgname=zeroclawlabs
pkgver=0.6.9
pkgrel=1
pkgdesc="Zero overhead. Zero compromise. 100% Rust. The fastest, smallest AI assistant."
arch=('x86_64' 'aarch64')
url="https://github.com/zeroclaw-labs/zeroclaw"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'openssl')
makedepends=('rust' 'cargo' 'nodejs' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zeroclaw-labs/zeroclaw/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('08e3d503f6e6903ac2c52f46424ae03b279c17875a7f5dc0a06093890bd7fe7b')

prepare() {
  cd "zeroclaw-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "zeroclaw-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --features channel-matrix,channel-lark
}

package() {
  cd "zeroclaw-${pkgver}"
  install -Dm755 "target/release/zeroclaw" "${pkgdir}/usr/bin/zeroclaw"
  install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
