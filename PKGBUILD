# Maintainer: Mike Cuche <mike@cuche.cc>

pkgname=snowemu
pkgver=1.4.0
pkgrel=1
pkgdesc="A friendly and accurate 68k Macintosh emulator"
arch=(x86_64 aarch64)
url="https://snowemu.com/"
license=(MIT)
options=(!debug !lto)
depends=(alsa-lib sdl2)
makedepends=(cargo)
source=(https://github.com/twvd/snow/archive/refs/tags/v${pkgver}.tar.gz)

sha256sums=('8cabfc1948fe967f2c32eea014a02be1125b959c7d5345cbed3bf7bd67c811f0')

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd $srcdir/snow-${pkgver}
  cargo fetch --locked --target host-tuple
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd $srcdir/snow-${pkgver}
  cargo build --frozen --release
}

package() {
  cd $srcdir/snow-${pkgver}
  install -Dm755 "target/release/snowemu" "${pkgdir}/usr/bin/snowemu"
  install -Dm644 "assets/snow.desktop" "${pkgdir}/usr/share/applications/snow.desktop"
  install -Dm644 "assets/snow_icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/snow_icon.png"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
