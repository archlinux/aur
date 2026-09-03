# Maintainer: taxin-404 <taxin404@duck.com>

pkgname=flea
pkgver=0.1.2
pkgrel=2
pkgdesc='Fast, keyboard-first file manager for Omarchy'
arch=('x86_64')
url='https://github.com/thisisgm/flea'
license=('MIT')
# omarchy owns /usr/share/omarchy/shell, which ui/Commons and ui/Ui link into; quickshell owns qs.
depends=('bubblewrap' 'glib2' 'omarchy' 'quickshell' 'shared-mime-info' 'xdg-utils')
makedepends=('cargo')
optdepends=('libarchive: archive listing and extraction'
            '7zip: 7z archive support'
            'imagemagick: image conversion'
            'tailscale: Taildrop sharing')
# The release profile strips, so a debug package would have nothing to hold.
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/thisisgm/flea/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3788a735be2cb6eef0c1770833c82bc6591e20b7681fe02172aaea21c2a2d8fb')

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
}
