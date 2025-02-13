# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-mirakuru
_pkgname=${pkgname#python-}
pkgver=2.6.0
pkgrel=1
pkgdesc="Start your subprocess and wait for a clear indication that it's running"
arch=(any)
url="https://github.com/ClearcodeHQ/mirakuru"
license=(LGPL-3.0-only)
depends=(
  python
  python-psutil
)
makedepends=(
  python-build
  python-installer
  python-wheel
)
checkdepends=(
  openbsd-netcat
  procps-ng
  python-daemon
  python-pytest
  python-pytest-rerunfailures
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fc5d541874255fca66e1a6d0dd12731687866b5ed1d7359d30b6db367c955270')

_archive="$_pkgname-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  pytest --deselect tests/executors/test_executor_kill.py::test_daemons_killing
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
