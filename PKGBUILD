# Maintainer: latte_macchiato <contact@lattemacchiato.dev>

pkgname=late-sh-cli
pkgver=0.43.9
pkgrel=1
pkgdesc='Companion CLI for late.sh terminal clubhouse'
arch=('x86_64')
url='https://github.com/mpiorowski/late-sh'
license=('LicenseRef-FSL-1.1-MIT')
depends=('alsa-lib' 'gcc-libs' 'glib2' 'glibc' 'gtk3' 'webkit2gtk-4.1')
makedepends=('cargo' 'cmake' 'git' 'mold' 'nasm')
options=('!debug' '!lto')
source=("git+https://github.com/mpiorowski/late-sh.git#tag=v${pkgver//_/-}")
sha256sums=('a7721c04bdf19f36d8c3bbde8c455fdc04ae4d84a3abd88ac234ff2d09eb2424')

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
  export RUSTFLAGS="${RUSTFLAGS} -C link-arg=-fuse-ld=mold --remap-path-prefix=${srcdir}=/"
  cargo build --frozen --release --bin late
}

check() {
  cd late-sh
  export CARGO_HOME="${srcdir}/cargo-home"
  export CARGO_TARGET_DIR=target
  export RUSTUP_TOOLCHAIN=stable
  export RUSTFLAGS="${RUSTFLAGS} -C link-arg=-fuse-ld=mold --remap-path-prefix=${srcdir}=/"
  cargo test --frozen -p late-cli
}

package() {
  cd late-sh
  install -Dm755 target/release/late "${pkgdir}/usr/bin/late"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 late-cli/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
