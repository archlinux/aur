# Maintainer: sachesi <xsachesi@pm.me>

# pkgver and sha256sums are filled in by .github/workflows/aur.yml for each release.
pkgname=edid-editor
pkgver=0.4.0
pkgrel=1
pkgdesc='EDID editor for GNOME, with a command line interface'
arch=('x86_64' 'aarch64')
url='https://github.com/sachesi/edid-editor'
license=('GPL-3.0-or-later')
depends=('gtk4>=1:4.10' 'libadwaita>=1:1.8' 'glib2' 'hicolor-icon-theme' 'gcc-libs' 'glibc')
# python generates the sample EDID data the tests read.
makedepends=('meson' 'gettext' 'python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('d7866c52077f8270a7406d4d73d4e902ca5ce8295a8b533d73027d27afc5e7c2')

build() {
  arch-meson "$pkgname-$pkgver" build -Dgui=enabled
  meson compile -C build
}

check() {
  # The ui suite needs a Wayland compositor.
  meson test -C build --no-suite ui --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
