pkgname=rfetch
pkgver=0.7.0
pkgrel=1
pkgdesc="Convenient and easy fetch tool written in Rust"
arch=('x86_64')
url="https://github.com/skerrixx/rfetch"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('rust' 'git')

source=("rfetch::git+https://github.com/skerrixx/rfetch.git#tag=v${pkgver}")
sha256sums=('30ee05774b8a5f57a00f88a46c167ea5eb3e49d9198c34addfa2450049ffe74b')

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
