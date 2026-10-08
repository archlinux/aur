# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=solitaire
pkgver=51.0
pkgrel=1
pkgdesc="Play patience games"
arch=('x86_64')
url="https://gitlab.gnome.org/wwarner/Solitaire"
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
  'vala'
)
checkdepends=(
  'desktop-file-utils'
  'appstream'
)
source=("$url/-/archive/$pkgver/Solitaire-$pkgver.tar.gz")
sha256sums=('14e37c6ae8ddc9b8fb16604b4c5e50f3f5fb8e9733f965b05a11aed7dfe5ea38')

prepare() {
  cd "Solitaire-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target host-tuple
}

build() {
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "Solitaire-$pkgver" build --buildtype=release
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
