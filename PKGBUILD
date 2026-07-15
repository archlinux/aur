# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=solitaire
pkgver=50.3
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
sha256sums=('725eb81532bb7033674affdc6ba0c5361a22e6e0ae2a63b0fd71e3fd74544888')

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
