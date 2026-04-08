# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Eli Schwartz
pkgname=smile
pkgver=2.12.2
pkgrel=1
pkgdesc="An emoji picker with custom tags support"
arch=('any')
url="https://smile.mijorus.it"
license=('GPL-3.0-or-later')
depends=(
  'emoji-font'
  'gtk4'
  'libadwaita'
  'python-dbus'
  'python-gobject'
  'which'
)
makedepends=('meson')
checkdepends=('appstream-glib')
optdepends=(
  'dotool: Automatically paste emojis (Wayland)'
  'wl-clipboard: Backend for clipboard action (Wayland)'
  'xdotool: Automatically paste emojis (X11)'
)
conflicts=("$pkgname-emoji-picker")
source=("$pkgname-$pkgver.tar.gz::https://github.com/mijorus/smile/archive/refs/tags/$pkgver.tar.gz"
        'autopaste'
        'autopaste.service')
sha256sums=('7ad25b956c11cd24fac14c34032d47b2b9b5f2cef401d0e9f5b7b4f004e79c01'
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
