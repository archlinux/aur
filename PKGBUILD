# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=iconic
pkgver=2026.4.1
pkgrel=2
pkgdesc="An application made for GNOME written in Rust to easily add images on top of folders"
arch=('x86_64')
url="https://github.com/youpie/Iconic"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'libxml2'
)
makedepends=(
  'blueprint-compiler'
  'cargo'
  'meson'
)
source=("Iconic-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ef372467332f421d78e0615ceeeebe574396f25b27cf3a1a69028166155a81f1')

prepare() {
  cd "Iconic-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target host-tuple

  # This is not a Flatpak
  sed -i 's|app/share|usr/share|g' \
    src/{windows/file_handling,windows/regeneration}.rs
}

build() {
  CFLAGS+=" -ffat-lto-objects"
  CXXFLAGS+=" -ffat-lto-objects"
  export GETTEXT_SYSTEM=true
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "Iconic-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
