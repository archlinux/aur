# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=scratchmark
pkgver=1.6.0
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
sha256sums=('81efd0156f3132e8231b3e0ab07ab263c798079e3d133807695df038309b2a03')

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
