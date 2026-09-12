# Maintainer: taxin-404 <taxin404@duck.com>

pkgname=flea
pkgver=0.2.1
pkgrel=1
pkgdesc='Fast, keyboard-first file manager for Omarchy'
arch=('x86_64')
url='https://github.com/thisisgm/flea'
license=('MIT')
# omarchy owns /usr/share/omarchy/shell, which ui/Commons and ui/Ui link into; quickshell owns qs.
# util-linux is needed since 0.1.3: the sandbox refuses the job without prlimit, which it ships.
depends=('bubblewrap' 'glib2' 'omarchy' 'python-gobject' 'quickshell' 'shared-mime-info' 'util-linux' 'xdg-utils')
makedepends=('cargo')
optdepends=('libarchive: archive listing and extraction'
            '7zip: 7z archive support'
            'imagemagick: image conversion'
            'tailscale: Taildrop sharing')
# The release profile strips, so a debug package would have nothing to hold.
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/thisisgm/flea/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('75f9ac0274a09a0d55cf7d9187943983c1b78a9e443465738b3ac8af8f2a77e9')

build() {
  cd "$pkgname-$pkgver"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo test --release --locked
  # These two need no built binary and locate themselves, so they run correctly under makepkg.
  ./tests/js.sh
  ./tests/keymap-gen.sh
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$srcdir/target/release/flea" "$pkgdir/usr/bin/flea"
  install -Dm644 packaging/com.thisisgm.flea.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 packaging/com.thisisgm.flea.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  # paths.rs looks for /usr/share/flea/ui/shell.qml, so the UI ships as data beside the binary.
  install -Dm644 ui/qmldir ui/*.qml -t "$pkgdir/usr/share/flea/ui"
  install -Dm644 ui/js/*.js -t "$pkgdir/usr/share/flea/ui/js"
  # Commons and Ui are Omarchy's own, reached as qs.Commons: the checkout links them and so does the package.
  ln -s /usr/share/omarchy/shell/Commons "$pkgdir/usr/share/flea/ui/Commons"
  ln -s /usr/share/omarchy/shell/Ui "$pkgdir/usr/share/flea/ui/Ui"

  # D-Bus portal and filemanager1 tools (required for file picker)
  install -Dm755 tools/flea-portal "$pkgdir/usr/lib/flea/flea-portal"
  install -Dm644 packaging/flea.portal -t "$pkgdir/usr/share/xdg-desktop-portal/portals"
  install -Dm644 packaging/org.freedesktop.impl.portal.desktop.flea.service -t "$pkgdir/usr/share/dbus-1/services"
  install -Dm755 tools/flea-filemanager1 "$pkgdir/usr/lib/flea/flea-filemanager1"
  install -Dm644 packaging/com.thisisgm.flea.FileManager1.service -t "$pkgdir/usr/share/dbus-1/services"
}
