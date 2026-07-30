pkgname=rfetch
pkgver=0.4.0
pkgrel=2
pkgdesc="Simple fetch tool written in Rust"
arch=('x86_64')
url="https://github.com/skerrixx/rfetch"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'git')

source=("rfetch::git+https://github.com/skerrixx/rfetch.git#tag=v${pkgver}")
sha256sums=('7e60b1c8795409a1b21fa737cdcc86a353a9a8d87ef7eeedc42744ead6858b89')

prepare() {
  cd "$(dirname "$(find "$srcdir" -name Cargo.toml -print -quit)")"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
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
