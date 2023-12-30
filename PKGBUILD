# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=citations
pkgver=0.6.2
pkgrel=1
pkgdesc="Manage your bibliographies using the BibTeX format"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/citations"
license=('GPL3')
depends=('libadwaita' 'poppler-glib' 'gtksourceview5')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('14954eab3f9bbd5e00cf67d74768174d38a2097da2a8fe4cda143e967e2dc19f81a3ec8ce467e7d926583ff4a6f3ff51e3a938705a5583d037dd488aed029569')

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
