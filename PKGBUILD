# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-skip-markers
pkgname=python-pytest-skip-markers
pkgver=1.4.0
pkgrel=3
pkgdesc="A Pytest plugin which implements a few useful skip markers"
arch=(any)
url="https://github.com/saltstack/pytest-skip-markers"
license=(Apache)
depends=(python python-attrs python-distro python-pytest)
makedepends=(python-build python-installer python-setuptools python-setuptools-declarative-requirements python-setuptools-scm python-toml python-wheel)
checkdepends=(python-pyfakefs python-pytest-subtests)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('1095c5d1103d77779cbe805ea8a7beeb3be6e46529778fb1ca72e4250cfa8ec2')
b2sums=('eb90bc376cf26d5740c099331ae984dfcafb46e340fef406653967b865c9f9d26d6dcb3e68c4e40932b7bc43c09b67f9ae9bef1300a8719002e1f8ab59bb8acc')

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
