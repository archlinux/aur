# Maintainer: xiota / aur.chaotic.cx
# Contributor: fsyy <fossy2001 at web.de>

_pkgname="streamdeck-ui"
pkgname="$_pkgname-git"
pkgver=4.1.3.r2.gdecda13
pkgrel=2
pkgdesc="Frontend for the Elgato Stream Deck"
url="https://github.com/streamdeck-linux-gui/streamdeck-linux-gui"
license=('MIT')
arch=('any')

depends=(
  'pyside6'
  'python'
  'python-cairosvg'
  'python-elgato-streamdeck' # AUR
  'python-evdev'
  'python-filetype'
  'python-pillow'
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

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git"
  "streamdeck-ui.desktop"
  "streamdeck.png"
  "streamdeck.service"
)
sha256sums=(
  'SKIP'
  '745bbc947cfe4536e52721ef65db75c599903c0ab3450fbbf96c44e322e42c4c'
  '03726bef65cec1a2ff4bb0241e021d112bf8b5a9a90ca0e3ebeba34358b281fe'
  'f3350b2db661c0eebd8bbe3305d81d0189aa24552c286a9302484a32845526e0'
)

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  DISABLE_CONAN=ON python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 udev/60-streamdeck.rules -t "$pkgdir/usr/lib/udev/rules.d/"
  install -Dm644 "$srcdir/streamdeck.service" -t "$pkgdir/usr/lib/systemd/user/"

  install -Dm644 "$srcdir/streamdeck-ui.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "$srcdir/streamdeck.png" -t "$pkgdir/usr/share/pixmaps/"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
