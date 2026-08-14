# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=ffdash-git
pkgver=0.3.2.r2.gb01e785
pkgrel=1
pkgdesc="Terminal UI for batch AV1 & VP9 video encoding with hardware acceleration, real-time progress monitoring, and full control over quality settings"
arch=(x86_64)
url="https://github.com/bcherb2/ffdash"
license=(MIT)
depends=(
    ffmpeg
    glibc
    libgcc
    )
makedepends=(
    git
    cargo
    )
provides=(ffdash)
conflicts=(ffdash)
source=("git+https://github.com/bcherb2/ffdash.git")
sha256sums=('SKIP')

pkgver() {
  cd ffdash
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ffdash
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd ffdash
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd ffdash
  install -D target/release/ffdash -t ${pkgdir}/usr/bin
  install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
