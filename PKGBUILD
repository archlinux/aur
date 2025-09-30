# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=iconic
pkgver=2025.9.1
pkgrel=1
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
options=('!lto')
source=("Iconic-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e76a0e4951bd1845b3f4ddc8d3f289b2c464185e9401c3e4f65dd537aaed0841')

prepare() {
  cd "Iconic-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"

  # This is not a Flatpak
  sed -i 's|app/share|usr/share|g' \
    src/{windows/file_handling,windows/regeneration}.rs
}

build() {
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
