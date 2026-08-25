# Maintainer: Joseph Vigil <joeyvigil109329@gmail.com>
pkgname=omasettings
pkgver=2.0.0
pkgrel=1
pkgdesc="Terminal UI for adjusting Omarchy settings: theme, keybindings, displays, audio, and more"
arch=('any')
url="https://github.com/joeyvigil/omasettings"
license=('MIT')
depends=('bash' 'gum' 'jq' 'fzf' 'chafa')
optdepends=(
  'omarchy: the system this configures — required in practice'
  'hyprland: window appearance, input, and monitor settings'
  'libpulse: audio device selection'
  'wireplumber: volume control'
  'iw: Wi-Fi power saving status'
  'networkmanager: Wi-Fi power saving on Omarchy 4'
  'waybar: status bar configuration on Omarchy 3'
  'mako: notification settings on Omarchy 3'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('645ec4798a21059f015dbb89b7e723dce87b6cbe479ee033aa7e1374549fe368')

check() {
  cd "$srcdir/$pkgname-$pkgver"
  local f
  for f in bin/omasettings lib/*.sh install.sh; do
    bash -n "$f"
  done
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # The wrapper resolves its libs relative to its own real path, so the binary
  # on PATH is a symlink back into /usr/share rather than a copy.
  install -Dm755 bin/omasettings "$pkgdir/usr/share/$pkgname/bin/omasettings"
  install -Dm644 -t "$pkgdir/usr/share/$pkgname/lib" lib/*.sh

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/share/$pkgname/bin/omasettings" "$pkgdir/usr/bin/omasettings"

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
