# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Eli Schwartz
pkgname=smile
pkgver=2.11.0
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
  'dotool: For autopaste service'
  'wl-clipboard: Automatically paste emojis (Wayland)'
  'xdotool: Automatically paste emojis (X11)'
)
conflicts=("$pkgname-emoji-picker")
source=("$pkgname-$pkgver.tar.gz::https://github.com/mijorus/smile/archive/refs/tags/$pkgver.tar.gz"
        'autopaste'
        'autopaste.service')
sha256sums=('a4e85c3af5783789498b1bf84211747a08299441305ac97d0210a754a55bd11e'
            'bb7322edc8d03836f9d74db75406ea02de5642f22d01a47ef2c02dad768eae67'
            '7d5faaba3616c6d1d3534b878309a109a887c75191b675c2c0122362c6a39364')

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

  install -Dm755 "$srcdir/autopaste" -t "$pkgdir/usr/share/$pkgname/"
  install -Dm644 "$srcdir/autopaste.service" -t "$pkgdir/usr/lib/systemd/user/"

  rm -v "$pkgdir/usr/share/icons/hicolor/scalable/actions/meson.build"
  rm -v "$pkgdir/usr/share/$pkgname/assets/meson.build"
  rm -v "$pkgdir/usr/share/$pkgname/$pkgname/meson.build"
}
