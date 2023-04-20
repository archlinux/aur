# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=citations
pkgver=0.5.2
pkgrel=1
pkgdesc="Manage your bibliographies using the BibTeX format"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/citations"
license=('GPL3')
depends=('libadwaita' 'poppler-glib' 'gtksourceview5')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('6706cd7930f45c0b386a21cad5115b9bf77b54ca6f6f34339be0544c0c55a917d8bd21d0f230a1cc127c487c9b6ef50217df09b87b61b2e863b6a8ecd6584b28')

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
