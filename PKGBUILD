# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=iconic
pkgver=2025.3.2
pkgrel=1
pkgdesc="An application made for GNOME written in Rust to easily add images on top of folders"
arch=('x86_64')
url="https://github.com/youpie/Iconic"
license=('GPL-3.0-or-later')
depends=('libadwaita')
makedepends=(
  'blueprint-compiler'
  'cargo'
  'meson'
)
source=("Iconic-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('36cdecfa56112b92e51aaee5ff570c933ee160b2c972e8ea100b580578c2b589')

prepare() {
  cd "Iconic-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"

  # This is not a Flatpak
  sed -i 's|app/share|usr/share|g' \
    src/{config,windows/file_handling,windows/regeneration}.rs
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
