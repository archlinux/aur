# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=turtle
_app_id="de.philippun1.$pkgname"
pkgver=0.9
pkgrel=1
pkgdesc="Manage your git repositories with easy-to-use dialogs in Nautilus."
arch=('any')
url="https://gitlab.gnome.org/philippun1/turtle"
license=('GPL-3.0-or-later')
depends=(
  'libadwaita'
  'meld'
  'python-dbus'
  'python-gobject'
  'python-pygit2'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('appstream')
#checkdepends+=('python-pytest')
optdepends=(
  'python-nautilus: Nautilus plugin'
  'thunarx-python: Thunar plugin'
  'nemo-python: Nemo plugin'
  'python-caja: Caja plugin'
  'seahorse: sign commits'
)
conflicts=('turtlegit')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        'https://gitlab.gnome.org/philippun1/turtle/-/commit/eeabb0e3e2f70296009d679f7a14311f547b74f5.patch')
sha256sums=('d0090c59f9b88cae8ac73b38c005edce0d19d81b865c99db3097819868a46082'
            '6b6610e5162b21d583f5bb709e29401caaca67e059b6193a870038704ddff8f1')

prepare() {
  cd "$pkgname-$pkgver"

  # https://gitlab.gnome.org/philippun1/turtle/-/issues/43
  patch -Np1 -i ../eeabb0e3e2f70296009d679f7a14311f547b74f5.patch
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
   cd "$pkgname-$pkgver"
#  PYTHONPATH=./ pytest

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
  install -Dm644 "plugins/${pkgname}"{_nautilus.py,_nautilus_compare.py} -t \
    "$pkgdir/usr/share/nautilus-python/extensions/"
  install -Dm644 "plugins/${pkgname}_thunar.py" -t \
    "$pkgdir/usr/share/thunarx-python/extensions/"
  install -Dm644 "plugins/${pkgname}_nemo.py" -t \
    "$pkgdir/usr/share/nemo-python/extensions/"
  install -Dm644 "plugins/${pkgname}_caja.py" -t \
    "$pkgdir/usr/share/caja-python/extensions/"
}
