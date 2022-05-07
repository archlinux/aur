# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=geopard
pkgver=1.0.1
pkgrel=1
pkgdesc="Gemini browser in gtk4"
arch=('x86_64' 'aarch64')
url="https://ranfdev.com/projects/Geopard"
license=('unknown')
depends=('libadwaita')
makedepends=('blueprint-compiler' 'cargo' 'gobject-introspection' 'meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ranfdev/Geopard/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a2b289d070b6df8daad123ffb9acef03f700bd0becb57e7ee32f1f650a75a0f7')

prepare() {
  cd "Geopard-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"

  # Relax validate-appdata test
  sed -i "s/'validate', '--nonet'/'validate-relax', '--nonet'/g" data/meson.build
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "Geopard-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
