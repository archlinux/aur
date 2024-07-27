# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-pytest-memray
_pkgname=${pkgname#python-}
pkgver=1.7.0
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
  python-anyio
  python-flaky
  python-pytest-xdist
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('ca10a74053ca4d75d160b82cd988182608b1ea0a8274771adf1412a1c6edef0f')

build() {
  cd "$_pkgname-$pkgver"

  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"

  rm -rf tmp_install
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m installer --destdir=tmp_install dist/*.whl

  export PYTHONPATH="$PWD/tmp_install/$site_packages:$PYTHONPATH"
  pytest tests
}

package() {
  cd "$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
