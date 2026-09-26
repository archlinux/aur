# Maintainer: sachesi <xsachesi@pm.me>

# pkgver and sha256sums are filled in by .github/workflows/aur.yml for each release.
pkgname=edid-editor
pkgver=0.5.0
pkgrel=1
pkgdesc='EDID editor for GNOME, with a command line interface'
arch=('x86_64' 'aarch64')
url='https://github.com/sachesi/edid-editor'
license=('GPL-3.0-or-later')
depends=('gtk4>=1:4.22' 'libadwaita>=1:1.9' 'glib2' 'hicolor-icon-theme' 'gcc-libs' 'glibc')
# python generates the sample EDID data the tests read.
makedepends=('meson' 'gettext' 'python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('2616490c492aa874f0983c171ee7348651551c54b5fc78adf265b82d71aa59c6')

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
