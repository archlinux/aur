# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=scratchmark
pkgver=1.10.0
pkgrel=1
pkgdesc="Organized markdown editor"
arch=('x86_64')
url="https://scratchmark.org"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'gtksourceview5'
  'libadwaita'
  'libspelling'
)
makedepends=(
  'cargo'
  'meson'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/sevonj/scratchmark/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e2a77909b45af141bf770cd51d8092559c0629d4a3db1b48bd487cd0778af88d')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  export GETTEXT_SYSTEM=true
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "$pkgname-$pkgver" build --buildtype=release -Doffline=true
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
