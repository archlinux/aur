# Maintainer:
# Contributor: fsyy <fossy2001 at web.de>

_pkgname="streamdeck-ui"
pkgname="$_pkgname-git"
pkgver=3.0.1.r9.g9c7e67b
pkgrel=1
pkgdesc="A Linux compatible UI for the Elgato Stream Deck"
arch=('any')
url="https://github.com/streamdeck-linux-gui/streamdeck-linux-gui"
license=('MIT')
depends=(
  'pyside6'
  'python-cairosvg'
  'python-filetype'
  'python-pillow'
  'python-setuptools' # silence namcap warning
  'python-xcffib'

  # AUR
  'python-elgato-streamdeck'
  'python-pynput'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-poetry'
  'python-wheel'
)
optdepends=(
  'gnome-shell-extension-appindicator: tray icon support gnome-shell'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

source=(
  "$_pkgname"::"git+$url"
  "60-streamdeck.rules"
  "elgato.png"
  "streamdeck-ui.desktop"
  "streamdeck.service"
)
sha256sums=(
  'SKIP'
  'f91b76a71ee5253bcc3dff2a096fb7c2cc8ec4f510c7a9adc4df1f0967ea3dd3'
  '03726bef65cec1a2ff4bb0241e021d112bf8b5a9a90ca0e3ebeba34358b281fe'
  'c1cbf82cd148377586d025c2736a0aec117cad0ebb54345bfa04515f26558b53'
  'f3350b2db661c0eebd8bbe3305d81d0189aa24552c286a9302484a32845526e0'
)

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  DISABLE_CONAN=ON python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 "$srcdir/60-streamdeck.rules" -t "$pkgdir/usr/lib/udev/rules.d"
  install -Dm 644 "$srcdir/streamdeck.service" -t "$pkgdir/usr/lib/systemd/user"

  install -Dm 644 "$srcdir/streamdeck-ui.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm 644 "$srcdir/elgato.png" -t "$pkgdir/usr/share/pixmaps"

  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
