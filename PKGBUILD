# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-pyvis
_name=${pkgname#python-}
pkgver=0.3.2
pkgrel=3
pkgdesc="Python package for creating and visualizing interactive network graphs"
arch=(any)
url="https://github.com/WestHealth/pyvis"
license=(BSD-3-Clause)
depends=(
  ipython
  python
  python-jinja
  python-jsonpickle
  python-networkx
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ff947e224d9825e4b0f3d6710075945c5c8d13bf60aa54e6396c996f34851a3a')

_archive="$_name-$pkgver"

prepare() {
  cd "$_archive"

  sed -i "s/find_packages()/find_packages(exclude=['pyvis.tests', 'pyvis.tests.*'])/" setup.py
}

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  pytest \
    --ignore pyvis/tests/test_html.py # Requires google-chrome & selenium
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE_BSD.txt
}
