pkgname=rfetch
pkgver=0.3.1
pkgrel=1
pkgdesc="Simple fetch tool written in Rust"
arch=('x86_64')
url="https://github.com/skerrixx/rfetch"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'git')

source=("rfetch::git+https://github.com/skerrixx/rfetch.git#tag=v${pkgver}")
sha256sums=('4b1bde4c7550e04376dac8b38f378f01806b4324adcac55ecc20e82a02f8d18a')

prepare() {
  cd "$(dirname "$(find "$srcdir" -name Cargo.toml -print -quit)")"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$(dirname "$(find "$srcdir" -name Cargo.toml -print -quit)")"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$(dirname "$(find "$srcdir" -name Cargo.toml -print -quit)")"

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd "$(dirname "$(find "$srcdir" -name Cargo.toml -print -quit)")"

  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
