# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=turtle
_app_id="de.philippun1.$pkgname"
pkgver=0.5.2
pkgrel=1
pkgdesc="Manage your git repositories with easy-to-use dialogs in Nautilus."
arch=('any')
url="https://gitlab.gnome.org/philippun1/turtle"
license=('GPL3')
depends=('libadwaita' 'meld' 'python-gobject' 'python-pygit2')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('appstream-glib' 'python-pytest')
optdepends=('python-nautilus: Nautilus plugin'
            'thunarx-python: Thunar plugin'
            'nemo-python: Nemo plugin'
            'python-caja: Caja plugin')
conflicts=('turtlegit')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('0e762231700d84d4db8532c2f5b81072a6dfc1b155f9967d8526adaf4322a7cc')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
   cd "$pkgname-$pkgver"
  PYTHONPATH=./ pytest

  appstream-util validate-relax --nonet "data/${_app_id}.metainfo.xml"
  desktop-file-validate "data/${_app_id}.desktop"
}

package() {
   cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "data/icons/hicolor/scalable/apps/${_app_id}.svg" -t \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 "data/icons/hicolor/symbolic/apps/${_app_id}-symbolic.svg" -t \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/"
  install -Dm644 "data/${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "data/${_app_id}.gschema.xml" -t "$pkgdir/usr/share/glib-2.0/schemas/"
  install -Dm644 "data/${_app_id}.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 "plugins/${pkgname}"{_nautilus.py,_nautilus_compare.py} -t \
    "$pkgdir/usr/share/nautilus-python/extensions/"
  install -Dm644 "plugins/${pkgname}_thunar.py" -t \
    "$pkgdir/usr/share/thunarx-python/extensions/"
  install -Dm644 "plugins/${pkgname}_nemo.py" -t \
    "$pkgdir/usr/share/nemo-python/extensions/"
  install -Dm644 "plugins/${pkgname}_caja.py" -t \
    "$pkgdir/usr/share/caja-python/extensions/"
}
