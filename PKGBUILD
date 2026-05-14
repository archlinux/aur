# Maintainer: Latte <latte@invalid>

pkgname=late-cli
pkgver=0.24.7
pkgrel=1
pkgdesc='Companion CLI for late.sh terminal clubhouse'
arch=('x86_64')
url='https://github.com/mpiorowski/late-sh'
license=('custom:FSL-1.1-MIT')
depends=('alsa-lib' 'gcc-libs' 'glibc')
makedepends=('cargo' 'git' 'mold')
source=("git+https://github.com/mpiorowski/late-sh.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd late-sh
  export CARGO_HOME="${srcdir}/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked
}

build() {
  cd late-sh
  export CARGO_HOME="${srcdir}/cargo-home"
  export CARGO_TARGET_DIR=target
  export RUSTUP_TOOLCHAIN=stable
  export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix=${srcdir}=/"
  cargo build --frozen --release --bin late
}

check() {
  cd late-sh
  export CARGO_HOME="${srcdir}/cargo-home"
  export CARGO_TARGET_DIR=target
  export RUSTUP_TOOLCHAIN=stable
  export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix=${srcdir}=/"
  cargo test --frozen -p late-cli
}

package() {
  cd late-sh
  install -Dm755 target/release/late "${pkgdir}/usr/bin/late"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 late-cli/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
