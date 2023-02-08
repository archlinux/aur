# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=citations
pkgver=0.5.1
pkgrel=1
pkgdesc="Manage your bibliographies using the BibTeX format"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/citations"
license=('GPL3')
depends=('libadwaita' 'poppler-glib' 'gtksourceview5')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('9510bc2ae8c94193728d635824f607f701410bbbb47ad96b67440886f355656ffe7cbad098fd444be639b90d0d2d309578e3f805350396972a70890d9ea2fdd5')

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
