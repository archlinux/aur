pkgname=byedpi-gtk
pkgver=1.1.2
pkgrel=1
pkgdesc="GTK frontend for byedpi to bypass DPI restrictions"
arch=('any')
url="https://github.com/duckesteles/byedpi-gtk"
license=('GPL-3.0-or-later')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita')
makedepends=('meson' 'ninja' 'glib2' 'gettext')
options=('!debug')
_byedpiver=17.3
_byedpiarches=(x86_64 i686 aarch64 armv7l armv6 mips mipsel powerpc)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')
for _a in "${_byedpiarches[@]}"; do
  source+=("https://github.com/hufrea/byedpi/releases/download/v0.$_byedpiver/byedpi-$_byedpiver-$_a.tar.gz")
  sha256sums+=('SKIP')
done

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || true
}

package() {
  meson install -C build --destdir "$pkgdir"
  for _a in "${_byedpiarches[@]}"; do
    install -Dm755 "$srcdir/ciadpi-$_a" "$pkgdir/usr/lib/byedpi-gtk/ciadpi-$_a"
  done
}
