# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Rafael Cavalcanti <rccavalcanti at gmail dot com>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: x-demon
pkgname=nicotine-plus-git
pkgver=3.1.2.dev1.r5463.5ce98e5f
pkgrel=1
pkgdesc="A graphical client for the SoulSeek peer-to-peer system"
arch=('any')
url="https://nicotine-plus.github.io/nicotine-plus"
license=('GPL3')
depends=('python-gobject' 'gtk3')
makedepends=('git')
optdepends=('gspell: for spell checking in chat'
            'libappindicator-gtk3: for tray icon')
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
  python setup.py build
}

check() {
  cd "$srcdir/${pkgname%-git}"
  _appdata_id=org.nicotine_plus.Nicotine

  # Some tests require an X server
  display=":70"
  Xvfb $display -screen 0 1024x768x24 -ac -noreset & xpid=$!
  trap "kill -TERM $xpid || :" EXIT
  sleep 3
  export DISPLAY=$display

  # Tests requiring an Internet connection are disabled
  pytest --deselect=test/unit/test_version.py

  desktop-file-validate data/$_appdata_id.desktop
  appstream-util validate-relax --nonet data/$_appdata_id.metainfo.xml
}

package() {
  cd "$srcdir/${pkgname%-git}"
  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  # Remove duplicate GPL license
  rm "$pkgdir/usr/share/doc/nicotine/COPYING"
}
