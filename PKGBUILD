# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Butui Hu <hot123tea123@gmail.com>

_name=PhiK
pkgname=python-phik
pkgver=0.12.5
pkgrel=2
pkgdesc='Phi_K correlation analyzer library'
arch=(x86_64)
url='https://github.com/kaveio/phik'
license=(Apache-2.0)
depends=(
  gcc-libs
  glibc
  python
  python-joblib
  python-matplotlib
  python-numpy
  python-pandas
  python-scipy
)
makedepends=(
  cmake
  pybind11
  python-build
  python-installer
  python-scikit-build-core
  python-wheel
)
checkdepends=(
  python-pytest
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('749c9f7202cd7bee0329e3fe2cded85479c8fb2f94c7f6f479cd85c9ebaa4c39a26f79f25aab88db5ee0adb8913aa1c5fe60d15a32ee39c85e6bc977a833dd92')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    -W ignore::DeprecationWarning
    # AssertionError - https://github.com/KaveIO/PhiK/issues/111
    --deselect tests/test_phik.py::PhiKTest::test_phik_calculation
  )

  cd $_name-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
