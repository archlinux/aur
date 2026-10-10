# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=turtle
_app_id="de.philippun1.$pkgname"
pkgver=0.14.1
pkgrel=1
pkgdesc="Manage your git repositories with easy-to-use dialogs in Nautilus."
arch=('any')
url="https://gitlab.gnome.org/philippun1/turtle"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'meld'
  'openssl'
  'python-dbus'
  'python-gobject'
  'python-gnupg'
  'python-nautilus'
  'python-pygit2'
  'python-secretstorage'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'appstream'
  'dbus'
  'desktop-file-utils'
  'python-pytest'
  'xorg-server-xvfb'
)
optdepends=(
  'nemo-python: Nemo plugin'
  'python-caja: Caja plugin'
  'thunarx-python: Thunar plugin'
  'seahorse: sign commits'
)
conflicts=('turtlegit')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('b1771b6f1deef5ba042ef4bb5dde2e8127edb8471374ee3a1270a94c472952d8')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  python -m venv --clear --without-pip --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  dbus-run-session xvfb-run test-env/bin/python -I -m pytest -k "not test_argparse.py"

  appstreamcli validate --no-net "data/${_app_id}.metainfo.xml"
  desktop-file-validate "data/${_app_id}.desktop"
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm755 "${pkgname}"{_cli,_service} -t "$pkgdir/usr/bin/"
  install -Dm644 data/completions/turtle_cli -t \
    "$pkgdir/usr/share/bash-completion/completions/"
  install -Dm644 "data/icons/hicolor/scalable/apps/${_app_id}.svg" -t \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 "data/icons/hicolor/symbolic/apps/${_app_id}-symbolic.svg" -t \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/"
  install -Dm644 "data/${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "data/${_app_id}.gschema.xml" -t "$pkgdir/usr/share/glib-2.0/schemas/"
  install -Dm644 "data/${_app_id}.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 "data/${_app_id}.service" -t "$pkgdir/usr/share/dbus-1/services/"
  install -Dm644 data/man/"${pkgname}"{_cli,_service}.1 -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 "plugins/${pkgname}"{_nautilus.py,_nautilus_compare.py} -t \
    "$pkgdir/usr/share/nautilus-python/extensions/"
  install -Dm644 "plugins/${pkgname}_thunar.py" -t \
    "$pkgdir/usr/share/thunarx-python/extensions/"
  install -Dm644 "plugins/${pkgname}_nemo.py" -t \
    "$pkgdir/usr/share/nemo-python/extensions/"
  install -Dm644 "plugins/${pkgname}_caja.py" -t \
    "$pkgdir/usr/share/caja-python/extensions/"
}
