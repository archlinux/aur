# Maintainer: taxin-404 <taxin404@duck.com>

pkgname=flea-git
pkgver=0.1.4.r0.g58a45fd
pkgrel=1
pkgdesc='Fast, keyboard-first file manager for Omarchy (git version)'
arch=('x86_64')
url='https://github.com/thisisgm/flea'
license=('MIT')
# omarchy owns /usr/share/omarchy/shell, which ui/Commons and ui/Ui link into; quickshell owns qs.
# util-linux is needed since 0.1.3: the sandbox refuses the job without prlimit, which it ships.
depends=('bubblewrap' 'glib2' 'omarchy' 'quickshell' 'shared-mime-info' 'util-linux' 'xdg-utils')
makedepends=('cargo' 'git')
optdepends=('libarchive: archive listing and extraction'
            '7zip: 7z archive support'
            'imagemagick: image conversion'
            'tailscale: Taildrop sharing')
provides=('flea')
conflicts=('flea')
options=('!debug')
source=("$pkgname::git+https://github.com/thisisgm/flea.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo build --release --locked
}

check() {
  cd "$pkgname"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo test --release --locked
  # These two need no built binary and locate themselves, so they run correctly under makepkg.
  ./tests/js.sh
  ./tests/keymap-gen.sh
}

package() {
  cd "$pkgname"
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
