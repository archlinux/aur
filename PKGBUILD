pkgname=rfetch
pkgver=0.3.1
pkgrel=8
pkgdesc="Simple fetch tool written in Rust"
arch=('x86_64')
url="https://github.com/skerrixx/rfetch"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'git')

source=("rfetch::git+https://github.com/skerrixx/rfetch.git#tag=v${pkgver}-artix")
sha256sums=('0d5373e7727d067fe34e690d818b94d4068ef85837bd7a940a588eb6d9b0b2b1')

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
