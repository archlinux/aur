# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=scratchmark
pkgver=1.9.1
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
sha256sums=('ec6acd7f458391a672873599aea33e13bbc4a57f91c89526eecafb687fb4eacf')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
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
