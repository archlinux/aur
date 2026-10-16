# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=fotema
pkgver=2.5.1
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
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2422758d4d0721dc146e30707d410d36d1ea6d1020fa7b0f162d7e1b03c36aad')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable

  cargo fetch --target host-tuple
}

build() {
  export RUSTUP_TOOLCHAIN=stable

  # https://github.com/aws/aws-lc-rs/issues/1097
  export AWS_LC_SYS_NO_JITTER_ENTROPY=1

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
