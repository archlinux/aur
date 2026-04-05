# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=fotema
pkgver=2.4.2
pkgrel=1
pkgdesc="Photo gallery for Linux"
arch=('x86_64')
url="https://github.com/blissd/fotema"
license=(
  'CC0-1.0'
  'CC-BY-2.0'
  'CC-BY-4.0'
  'CC-BY-NC-SA-4.0'
  'CC-BY-SA-4.0'
  'GFDL-1.3-or-later'
  'GPL-3.0-or-later'
  'MIT'
)
depends=(
  'ffmpeg'
  'fontconfig'
  'gtk4'
  'libadwaita'
  'lcms2'
  'libheif'
  'libseccomp'
  'libshumate'
  'onnxruntime'
  'opencv'
  'openssl'
  'xdg-desktop-portal'
)
makedepends=(
  'cargo'
  'clang'
  'meson'
  'mold'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2226eb41470b96af9e78edfc629f912ef6a457a7e0af1855d794517f6f7945d3')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable

  # Bump dependencies to fix build with ffmpeg 8.1
  cargo update ffmpeg-next --precise 8.1.0
  cargo update opencv --precise 0.98.2

  cargo fetch --target "$(rustc --print host-tuple)"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  cd "$pkgname-$pkgver"
  install -Dm644 LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}
