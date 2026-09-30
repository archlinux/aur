# Maintainer: ghollisjr <ghollisjr@gmail.com>

pkgname=quickkey
pkgver=1.0.0
pkgrel=1
pkgdesc='Hotkey menu of commands whose output goes to the clipboard'
arch=('any')
url='https://github.com/ghollisjr/quickkey'
license=('MIT')
# Arch's python ships _tkinter.so but does NOT depend on tk, and that .so
# links libtk8.6.so -- so without tk here, `import tkinter` fails at runtime.
# namcap reports tk as possibly unneeded; it is wrong, do not drop it.
depends=('python' 'tk')
optdepends=(
  'xclip: clipboard support under X11'
  'xsel: clipboard support under X11, alternative to xclip'
  'wl-clipboard: clipboard support under Wayland'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9d922defb097e0e9db0920f8cd28fa86ff28cbd9707ea5d79f46e9c3c30b0ac9')

check() {
  cd "$pkgname-$pkgver"
  python -c "import ast; ast.parse(open('quickkey.py').read())"
  python quickkey.py --config quickkey.conf --list >/dev/null
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 quickkey.py "$pkgdir/usr/bin/$pkgname"

  # a user unit: `systemctl --user enable --now quickkey.service`
  install -Dm644 quickkey.service \
    "$pkgdir/usr/lib/systemd/user/$pkgname.service"

  # last-resort config, so a fresh install has something in the menu; copy it
  # to ~/.config/quickkey/config to make it yours
  install -Dm644 quickkey.conf "$pkgdir/usr/share/$pkgname/quickkey.conf"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
