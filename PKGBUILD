# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-skip-markers
pkgname=python-pytest-skip-markers
pkgver=1.3.0
pkgrel=1
pkgdesc="A Pytest plugin which implements a few useful skip markers"
arch=(any)
url="https://github.com/saltstack/pytest-skip-markers"
license=(Apache)
depends=(python python-attrs python-distro python-pytest)
makedepends=(python-build python-installer python-setuptools python-setuptools-declarative-requirements python-setuptools-scm python-toml python-wheel)
checkdepends=(python-pyfakefs python-pytest-subtests)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('3ee7067afb42c1adde981278e588b0bae0634878607379e5012e461962646fd3')
b2sums=('8dc932adc6fbb5c3611d4221f9ff627b5aa30592de230c55abe58f6ed67b1008053ae1dfd104f45d6ca1687b75499b43d322820591c9f4e73f80aa00e14ce4e5')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  local _deselected=(
    # tests requiring other interpreters, etc.
    --deselect tests/functional/test_skip_if_binaries_missing.py::test_not_skipped
    --deselect tests/functional/test_skip_if_binaries_missing.py::test_not_skipped_multiple_binaries
    --deselect tests/unit/utils/markers/test_skip_if_binaries_missing.py::test_multiple_existing
    --deselect tests/unit/utils/markers/test_skip_if_binaries_missing.py::test_multiple_one_missing_check_all_false
  )

  cd $_name-$pkgver
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv "${_deselected[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGELOG,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
