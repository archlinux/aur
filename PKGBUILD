# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Rafael Cavalcanti <rccavalcanti at gmail dot com>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: x-demon
pkgname=nicotine-plus-git
_appdata_id=org.nicotine_plus.Nicotine
pkgver=3.3.0.dev4.r8514.577411e21
pkgrel=1
pkgdesc="A graphical client for the SoulSeek peer-to-peer system"
arch=('any')
url="https://nicotine-plus.org"
license=('GPL3')
depends=('python-gobject')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('gtk4: default Gtk version'
            'libadwaita: used with gtk4 if available'
            'gtk3: fallback if gtk4 is not installed'
            'gspell: for spell checking in chat (Gtk 3 only)'
            'libayatana-appindicator: tray icon (Gtk 3 only')
checkdepends=('appstream-glib' 'desktop-file-utils' 'python-pytest-xvfb')
provides=("${pkgname%-git}" 'nicotine+' 'nicotine')
conflicts=("${pkgname%-git}" 'nicotine+' 'nicotine')
source=('git+https://github.com/Nicotine-Plus/nicotine-plus.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s.r%s.%s" "$(python setup.py --version)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/${pkgname%-git}"

  # Some tests require an X server
  _display=":70"
  Xvfb ${_display} -screen 0 1024x768x24 -ac -noreset & xpid=$!
  trap "kill -TERM $xpid || :" EXIT
  sleep 3
  export DISPLAY=${_display}

  # Tests requiring an Internet connection are disabled
  pytest --deselect=test/unit/test_version.py

  desktop-file-validate data/${_appdata_id}.desktop
  appstream-util validate-relax --nonet data/${_appdata_id}.appdata.xml
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
