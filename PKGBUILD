# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=pods
pkgver=1.0.2
pkgrel=1
pkgdesc="A Podman desktop application"
arch=('x86_64' 'aarch64')
url="https://github.com/marhkb/pods"
license=('GPL3')
depends=('libadwaita' 'libpanel' 'gtksourceview5' 'podman' 'vte4')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver".tar.gz::$url/archive/v$pkgver.tar.gz)
b2sums=('4ae574f40efdbe5621aa93f095656151819a390fd315d643803bf4a09211408acf9a8522d0941c3c4efac0a12fc7177542c14395e3a65ef57947e435324e4364')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
