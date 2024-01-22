# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=turtle-git
_app_id="de.philippun1.${pkgname%-git}"
pkgver=0.6.1.r19.gbe9149b
pkgrel=1
pkgdesc="Manage your git repositories with easy-to-use dialogs in Nautilus."
arch=('any')
url="https://gitlab.gnome.org/philippun1/turtle"
license=('GPL-3.0-or-later')
depends=('libadwaita' 'meld' 'python-dbus' 'python-gobject' 'python-pygit2')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('appstream-glib')
#checkdepends+=('python-pytest')
optdepends=('python-nautilus: Nautilus plugin'
            'thunarx-python: Thunar plugin'
            'nemo-python: Nemo plugin'
            'python-caja: Caja plugin')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'turtlegit')
replaces=('turtlegit-git')
source=('git+https://gitlab.gnome.org/philippun1/turtle.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/${pkgname%-git}"
#  PYTHONPATH=./ pytest

  appstream-util validate-relax --nonet "data/${_app_id}.metainfo.xml"
  desktop-file-validate "data/${_app_id}.desktop"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "data/icons/hicolor/scalable/apps/${_app_id}.svg" -t \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 "data/icons/hicolor/symbolic/apps/${_app_id}-symbolic.svg" -t \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/"
  install -Dm644 "data/${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "data/${_app_id}.gschema.xml" -t "$pkgdir/usr/share/glib-2.0/schemas/"
  install -Dm644 "data/${_app_id}.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 "plugins/${pkgname%-git}"{_nautilus.py,_nautilus_compare.py} -t \
    "$pkgdir/usr/share/nautilus-python/extensions/"
  install -Dm644 "plugins/${pkgname%-git}_thunar.py" -t \
    "$pkgdir/usr/share/thunarx-python/extensions/"
  install -Dm644 "plugins/${pkgname%-git}_nemo.py" -t \
    "$pkgdir/usr/share/nemo-python/extensions/"
  install -Dm644 "plugins/${pkgname%-git}_caja.py" -t \
    "$pkgdir/usr/share/caja-python/extensions/"
}
