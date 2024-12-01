# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Eli Schwartz
pkgname=smile
pkgver=2.10.0
pkgrel=2
pkgdesc="An emoji picker with custom tags support"
arch=('any')
url="https://smile.mijorus.it"
license=('GPL-3.0-or-later')
depends=('emoji-font' 'libadwaita' 'python-dbus' 'python-gobject')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
optdepends=('wl-clipboard: Automatically paste emojis (Wayland)'
            'xdotool: Automatically paste emojis (X11)')
conflicts=("$pkgname-emoji-picker")
#source=("$pkgname-$pkgver.tar.gz::https://github.com/mijorus/smile/archive/refs/tags/$pkgver.tar.gz")
_commit=fa7e57bdfd074032782ebf068a6be22c5f46b433  # 2.10.0
source=("git+https://github.com/mijorus/smile.git#commit=${_commit}")
sha256sums=('fbf78f14d8d584abf7467f1a6d80d410084edd049100c3932fed1ec9ffea5df4')

prepare() {
  cd "$pkgname"

  # This is not a Flatpak
  sed -i 's|flatpak run {self.application_id}|/usr/bin/smile|g' src/Settings.py
  desktop-file-edit --set-key=Exec --set-value="$pkgname" --set-icon="it.mijorus.smile" \
    "src/assets/$pkgname.autostart.desktop"
}

build() {
  arch-meson "$pkgname" build
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
