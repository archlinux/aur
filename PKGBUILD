# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Eli Schwartz
pkgname=smile
pkgver=2.9.5
pkgrel=1
pkgdesc="An emoji picker with custom tags support"
arch=('any')
url="https://smile.mijorus.it"
license=('GPL-3.0-or-later')
depends=('emoji-font' 'libadwaita' 'python-dbus' 'python-gobject')
makedepends=('meson')
checkdepends=('appstream-glib')
optdepends=('wl-clipboard: Automatically paste emojis (Wayland)'
            'xdotool: Automatically paste emojis (X11)')
conflicts=("$pkgname-emoji-picker")
source=("$pkgname-$pkgver.tar.gz::https://github.com/mijorus/smile/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('62b4cee49957182abdafd686d5fbdbc0553ff35eb61c702306e628e58e0af221')

prepare() {
  cd "$pkgname-$pkgver"

  # This is not a Flatpak
  sed -i 's|flatpak run {self.application_id}|/usr/bin/smile|g' src/Settings.py
}

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"

  rm -v "$pkgdir/usr/share/icons/hicolor/scalable/actions/meson.build"
  rm -v "$pkgdir/usr/share/$pkgname/assets/meson.build"
}
