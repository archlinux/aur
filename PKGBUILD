# Maintainer: agony <27015 at riseup dot net>

pkgname=pocket-tts
pkgver=4.0.1
pkgrel=1
pkgdesc="Kyutai's pocket-sized text-to-speech on the CPU, without Python"
arch=('x86_64' 'aarch64')
url='https://github.com/kyutai-labs/pocket-tts'
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++')
makedepends=('cargo' 'cmake')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4599639eadb01bbbc086dc983e5be774f22b8dec9e13769d53899b9de29c047e')

prepare() {
  cd "${pkgname}-${pkgver}/rust"
  # Upstream builds x86_64 for x86-64-v3; the target CPU comes from
  # RUSTFLAGS in makepkg.conf instead
  rm .cargo/config.toml
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${pkgname}-${pkgver}/rust"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "${pkgname}-${pkgver}/rust"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 rust/target/release/pocket-tts -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 rust/README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
