# Maintainer: xiota / aur.chaotic.cx
# Contributor: fsyy <fossy2001 at web.de>

_pkgname="streamdeck-ui"
pkgname="$_pkgname-git"
pkgver=3.2.0.r26.gf96faf8
pkgrel=1
pkgdesc="A Linux compatible UI for the Elgato Stream Deck"
arch=('any')
#"https://streamdeck-linux-gui.github.io/streamdeck-linux-gui/"
url="https://github.com/streamdeck-linux-gui/streamdeck-linux-gui"
license=('MIT')
depends=(
  #'python-xcffib'
  'pyside6'
  'python-cairosvg'
  'python-filetype'
  'python-importlib-metadata'
  'python-pillow'
  'python-setuptools'

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

if [ x"$pkgname" == x"$_pkgname" ] ; then
  # normal package
  _pkgsrc="$_pkgname"
  _pkgext="tar.gz"
  source+=("$_pkgsrc"::"git+$url.git#tag=v${pkgver%%.r*}")
  sha256sums+=('SKIP')

  pkgver() {
    echo "${pkgver%%.r*}"
  }
else
  # git package
  provides=("$_pkgname")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git")
  sha256sums+=('SKIP')

  pkgver() {
    git -C "$_pkgsrc" describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' \
      | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
  }
fi

source+=(
  "60-streamdeck.rules"
  "streamdeck-ui.desktop"
  "streamdeck.png"
  "streamdeck.service"
)
sha256sums+=(
  'f91b76a71ee5253bcc3dff2a096fb7c2cc8ec4f510c7a9adc4df1f0967ea3dd3'
  '745bbc947cfe4536e52721ef65db75c599903c0ab3450fbbf96c44e322e42c4c'
  '03726bef65cec1a2ff4bb0241e021d112bf8b5a9a90ca0e3ebeba34358b281fe'
  'f3350b2db661c0eebd8bbe3305d81d0189aa24552c286a9302484a32845526e0'
)

build() {
  cd "$_pkgsrc"
  DISABLE_CONAN=ON python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="${pkgdir:?}" dist/*.whl

  install -Dm644 "${srcdir:?}/60-streamdeck.rules" -t "${pkgdir:?}/usr/lib/udev/rules.d/"
  install -Dm644 "${srcdir:?}/streamdeck.service" -t "${pkgdir:?}/usr/lib/systemd/user/"

  install -Dm644 "${srcdir:?}/streamdeck-ui.desktop" -t "${pkgdir:?}/usr/share/applications/"
  install -Dm644 "${srcdir:?}/streamdeck.png" -t "${pkgdir:?}/usr/share/pixmaps/"

  install -Dm644 LICENSE -t "${pkgdir:?}/usr/share/licenses/${pkgname:?}/"
}
