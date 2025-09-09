# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Eli Schwartz
pkgname=smile
pkgver=2.10.2
pkgrel=1
pkgdesc="An emoji picker with custom tags support"
arch=('any')
url="https://mijorus.it/projects/smile/"
license=('GPL-3.0-or-later')
depends=(
  'emoji-font'
  'gtk4'
  'libadwaita'
  'python-dbus'
  'python-gobject'
)
makedepends=('meson')
checkdepends=('appstream-glib')
optdepends=(
  'wl-clipboard: Automatically paste emojis (Wayland)'
  'xdotool: Automatically paste emojis (X11)'
)
conflicts=("$pkgname-emoji-picker")
source=("$pkgname-$pkgver.tar.gz::https://github.com/mijorus/smile/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('9edd8e54653e43b6a7eb7fc44721ce918a615082594bdff5204756e35d0c7512')

prepare() {
  cd "$pkgname-$pkgver"

  # This is not a Flatpak
  sed -i 's|flatpak run {self.application_id}|/usr/bin/smile|g' src/Settings.py
  desktop-file-edit --set-key=Exec --set-value="$pkgname --start-hidden" --set-icon="it.mijorus.smile" \
    "src/assets/$pkgname.autostart.desktop"
}

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  rm -v "$pkgdir/usr/share/icons/hicolor/scalable/actions/meson.build"
  rm -v "$pkgdir/usr/share/$pkgname/assets/meson.build"
  rm -v "$pkgdir/usr/share/$pkgname/$pkgname/meson.build"
}
