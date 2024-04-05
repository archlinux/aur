# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-html
pkgname=python-pytest-html
pkgver=4.1.1
pkgrel=2
pkgdesc="Plugin for generating HTML reports for pytest results"
arch=(any)
url="https://github.com/pytest-dev/pytest-html"
license=(MPL-2.0)
depends=(
  python
  python-jinja
  python-pytest
  python-pytest-metadata
)
makedepends=(
  npm
  python-build
  python-hatch-vcs
  python-hatchling
  python-installer
  python-wheel
)
checkdepends=(
  python-assertpy
  python-beautifulsoup4
  python-pytest-mock
  python-pytest-rerunfailures
  python-pytest-xdist
)
optdepends=(
  'python-ansi2html: for converting ansi'
)
source=(
  $_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz
)
sha512sums=('c0cbb342d67ed222130907e43f9ab5ea792865598304d8de9b9da6d1d021a39c78468e79a7806b6a847384c555f060eb0236a905db29a92075e6b8682f12c838')
b2sums=('5ee18a3ff4ca4156519f15d89796d3bbb88628bd954441d590e0756699ddbf40e657b50733600af349bbcbee8b5e4b97797e8cecc26b8191214c7c8b17c5cc01')

build() {
  cd $_name-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}" testing/test_unit.py
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
