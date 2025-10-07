# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=fotema
pkgver=2.3.0
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
sha256sums=('a1ff32abf0868804cd9a9d01617080b58eca33797123e306069025303304ef83')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
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
