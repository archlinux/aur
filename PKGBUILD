# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-picologging
_pkgname=${pkgname#python-}
pkgver=0.9.3
pkgrel=4
pkgdesc="An optimized logging library for Python"
arch=(x86_64)
url="https://github.com/microsoft/picologging"
license=(MIT)
depends=(
  gcc-libs
  glibc
  python
)
makedepends=(
  cmake
  ninja
  python-build
  python-installer
  python-scikit-build
  python-setuptools
  python-wheel
)
checkdepends=(
  python-flaky
  python-hypothesis
  python-pytest
  python-pytest-memray
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('ed5e9d31c2d06fd02d4304bfb98cb200acbf11e1f03d6a5b341263cf312a18b2')

_archive="$_pkgname-$pkgver"

build() {
  cd "$_archive"

  export CMAKE_ARGS=-Wno-dev
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd "$_archive"

  rm -rf tmp_install
  python -m installer --destdir=tmp_install dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$site_packages"
  # Deselected test fails with MEMORY PROBLEMS in a chroot.
  pytest \
    --deselect tests/unit/test_logger.py::test_nested_frame_stack
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
