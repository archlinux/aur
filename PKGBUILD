# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Rafael Cavalcanti <rccavalcanti at gmail dot com>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: x-demon
pkgname=nicotine-plus-git
_appdata_id=org.nicotine_plus.Nicotine
pkgver=3.3.0.dev1.r7838.b88a6b7a
pkgrel=1
pkgdesc="A graphical client for the SoulSeek peer-to-peer system"
arch=('any')
url="https://nicotine-plus.org"
license=('GPL3')
depends=('python-gobject' 'gtk3')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('gspell: for spell checking in chat'
            'libappindicator-gtk3: option for tray icon'
            'libayatana-appindicator: option for tray icon'
            'gtk4: test the GTK4 version'
            'libadwaita: test the Libadwaita version')
checkdepends=('appstream-glib' 'desktop-file-utils' 'python-pytest-xvfb')
provides=("${pkgname%-git}" 'nicotine+' 'nicotine')
conflicts=("${pkgname%-git}" 'nicotine+' 'nicotine')
source=('git+https://github.com/Nicotine-Plus/nicotine-plus.git'
        "${_appdata_id}-gtk4.desktop"
        "${_appdata_id}-libadwaita.desktop")
sha256sums=('SKIP'
            'e92495dfede12d88797fe0bcaa03517399da6e0f8411b567005f65cb571aa97f'
            'ae4f84de9070ad57f43d6a801f20fce164560f0ecb88056e917aed41c4c967a8')

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

  install -Dm644 "$srcdir/${_appdata_id}"{-gtk4.desktop,-libadwaita.desktop} -t \
    "$pkgdir/usr/share/applications/"
}
