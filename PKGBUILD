# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Eli Schwartz
pkgname=smile
pkgver=2.8.1
pkgrel=1
pkgdesc="An emoji picker with custom tags support"
arch=('any')
url="https://smile.mijorus.it"
license=('GPL3')
depends=('dbus-python' 'libadwaita' 'python-manimpango')
makedepends=('meson')
checkdepends=('appstream-glib')
optdepends=('xdotool: Automatically paste emojis (X11 only)')
conflicts=("$pkgname-emoji-picker")
replaces=("$pkgname-emoji-picker")
source=("$pkgname-$pkgver.tar.gz::https://github.com/mijorus/smile/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6123fde310a20f986b0cd9ddd31d5e12411a59e774d9496d2b74c024370890d5')

prepare() {
  cd "$pkgname-$pkgver"

  # https://github.com/mijorus/smile/issues/3#issuecomment-1089216803
  sed -i 's/MESON_INSTALL_PREFIX/MESON_INSTALL_DESTDIR_PREFIX/g' \
    build-aux/meson/postinstall.py

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
