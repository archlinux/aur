# Maintainer: Douglas Moura <doug@douglasmoura.com>
pkgname=winkel
pkgver=0.1.5
pkgrel=1
pkgdesc="A metronome for Omarchy that follows the live theme (Rust + Quickshell)"
arch=(x86_64 aarch64)
url="https://github.com/DouglasdeMoura/winkel"
license=(MIT)
depends=(quickshell alsa-lib gcc-libs glibc hicolor-icon-theme)
optdepends=('ttf-jetbrains-mono-nerd: the default interface font')
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d69b7cc59cf55c2c4660bfd165fd086fb06a2092fb629e07927623deacc3e7d3')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  WINKEL_SILENT=1 cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  make install PREFIX=/usr DESTDIR="$pkgdir"
}
