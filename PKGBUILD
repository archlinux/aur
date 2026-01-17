# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=scratchmark
pkgver=1.7.0
pkgrel=1
pkgdesc="Organized markdown editor"
arch=('x86_64')
url="https://github.com/sevonj/scratchmark"
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cebfa3cfe3d9676294569072485aceb152cbaea32a9c1f66c12e07aae3b0998f')

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
