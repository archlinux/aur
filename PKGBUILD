# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Butui Hu <hot123tea123@gmail.com>

_name=visions
pkgname=python-visions
pkgver=0.8.1
pkgrel=1
pkgdesc='Type system for data analysis in Python'
arch=(any)
url='https://github.com/dylan-profiler/visions'
license=(BSD-4-Clause)
depends=(
  python
  python-attrs
  python-multimethod
  python-networkx
  python-numpy
  python-packaging
  python-pandas
  python-puremagic
  # subset of upstream optional dependencies (only those that are actually used)
  python-imagehash
  python-matplotlib
  python-pillow
  python-shapely
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('7c1d63060b830394ef13d293c97e5e5caf5a227301a0e6307cb451a0e56f1af367faac25b909f7ea34a59d0168b40e384fe6caa3e2325e5d01e42b656e5f46b9')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    -W ignore::DeprecationWarning
    -m "not spark_test"
  )

  cd $_name-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
