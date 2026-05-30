# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=solitaire
pkgver=50.2.1
pkgrel=1
pkgdesc="Play patience games"
arch=('x86_64')
url="https://gitlab.gnome.org/wwarner/Solitaire"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
#  'libgnome-games-support-3'
)
makedepends=(
  'blueprint-compiler'
  'cargo'
  'meson'
  'vala'
)
source=("$url/-/archive/$pkgver/Solitaire-$pkgver.tar.gz")
sha256sums=('6ab07326187732b1cd40b601ec9f6050542b92c2175759f53ddde6cea9e62800')

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
