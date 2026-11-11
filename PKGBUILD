# Maintainer: Douglas Moura <doug@douglasmoura.com>
pkgname=winkel
pkgver=0.2.1
pkgrel=1
pkgdesc="A metronome for Omarchy that follows the live theme (Rust + GPUI)"
arch=(x86_64 aarch64)
url="https://github.com/DouglasdeMoura/winkel"
license=(MIT)
depends=(alsa-lib gcc-libs glibc hicolor-icon-theme libxkbcommon libxkbcommon-x11 libxcb vulkan-icd-loader)
optdepends=('ttf-jetbrains-mono-nerd: the default interface font')
makedepends=(cargo clang vulkan-headers wayland wayland-protocols fontconfig freetype2)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6d291b949d623db256f01c63160ec1445ccff3a0cdf7aef05ab4e5465d8cea0d')

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
  WINKEL_SILENT=1 cargo test -p winkel-ui --features test-support --frozen
}

package() {
  cd "$pkgname-$pkgver"
  make install PREFIX=/usr DESTDIR="$pkgdir"
}
