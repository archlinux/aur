# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=scratchmark
pkgver=1.8.0
pkgrel=1
pkgdesc="Organized markdown editor"
arch=('x86_64')
url="https://scratchmark.org"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'gtksourceview5'
  'libadwaita'
)
makedepends=(
  'cargo'
  'meson'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/sevonj/scratchmark/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('10726b17614afeff5cf1194032e376ef8f3c9ca54701084ca32d2c522dd36b2c')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc --print host-tuple)"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "$pkgname-$pkgver" build --buildtype=release
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
