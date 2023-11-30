# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=sticky
pkgver=1.18
pkgrel=1
pkgdesc="A sticky notes app for the Linux desktop"
arch=('any')
url="https://github.com/linuxmint/sticky"
license=('GPL2')
#groups=('x-apps')
depends=(
    'gtk3'
    'gspell'
    'python-gobject'
    'python-xapp'
    'xapp'
)
makedepends=(
    'meson'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a6044cd87aea8f9980a69c679117868418ee743c5a68518a2f14e5137a50c799')

prepare() {
  cd "$pkgname-$pkgver"

  # Set version in About dialog
  sed -i "s/__DEB_VERSION__/${pkgver//+*/}/g" "usr/lib/$pkgname/$pkgname.py"

  # Fix license path
  sed -i 's|common-licenses/GPL|licenses/common/GPL/license.txt|g' \
    "usr/lib/$pkgname/$pkgname.py"
}

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  # Meson only installs desktop file, dbus service & locale
  cd "$pkgname-$pkgver"
  install -Dm755 "usr/bin/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "usr/lib/$pkgname"/* -t "$pkgdir/usr/lib/$pkgname/"
  install -Dm644 "usr/share/glib-2.0/schemas/org.x.$pkgname.gschema.xml" -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  install -Dm644 "usr/share/$pkgname"/* -t "$pkgdir/usr/share/$pkgname/"
  install -Dm644 "etc/xdg/autostart/$pkgname.desktop" -t "$pkgdir/etc/xdg/autostart/"
  cp -r usr/share/icons "$pkgdir/usr/share"
}
