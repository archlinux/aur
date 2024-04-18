# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-pytest-memray
_pkgname=${pkgname#python-}
pkgver=1.6.0
pkgrel=1
pkgdesc="A pytest plugin for easy integration of memray memory profiler"
arch=(any)
url="https://github.com/bloomberg/pytest-memray"
license=(Apache-2.0)
depends=(
  memray
  python
  python-pytest
)
makedepends=(
  python-build
  python-hatch-vcs
  python-installer
  python-wheel
)
checkdepends=(
  python-flaky
  python-pytest-xdist
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('67eb6d8a6225338f08ae05239e005601491da903077f7c28b1fdb2d06a137991')

_archive="$_pkgname-$pkgver"

build() {
  cd "$_archive"

  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  rm -rf tmp_install
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m installer --destdir=tmp_install dist/*.whl

  export PYTHONPATH="$PWD/tmp_install/$site_packages:$PYTHONPATH"
  pytest tests
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
