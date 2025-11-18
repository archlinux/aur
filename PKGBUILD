# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=turtle-git
_app_id="de.philippun1.${pkgname%-git}"
pkgver=0.13.3.r1.gd1e24a3
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
  'python-pygit2'
  'python-secretstorage'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'xorg-server-xvfb'
)
optdepends=(
  'nemo-python: Nemo plugin'
  'python-caja: Caja plugin'
  'python-nautilus: Nautilus plugin'
  'thunarx-python: Thunar plugin'
  'seahorse: sign commits'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'turtlegit')
source=('git+https://gitlab.gnome.org/philippun1/turtle.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  git -C "${pkgname%-git}" clean -dfx
}

build() {
  cd "${pkgname%-git}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname%-git}"
  PYTHONPATH=./ dbus-run-session xvfb-run pytest

  appstreamcli validate --no-net "data/${_app_id}.metainfo.xml"
  desktop-file-validate "data/${_app_id}.desktop"
}

package() {
  cd "${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm755 "${pkgname%-git}"{_cli,_service} -t "$pkgdir/usr/bin/"
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
  install -Dm644 data/man/"${pkgname%-git}"{_cli,_service}.1 -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 "plugins/${pkgname%-git}"{_nautilus.py,_nautilus_compare.py} -t \
    "$pkgdir/usr/share/nautilus-python/extensions/"
  install -Dm644 "plugins/${pkgname%-git}_thunar.py" -t \
    "$pkgdir/usr/share/thunarx-python/extensions/"
  install -Dm644 "plugins/${pkgname%-git}_nemo.py" -t \
    "$pkgdir/usr/share/nemo-python/extensions/"
  install -Dm644 "plugins/${pkgname%-git}_caja.py" -t \
    "$pkgdir/usr/share/caja-python/extensions/"
}
