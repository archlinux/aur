# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-skip-markers
pkgname=python-pytest-skip-markers
pkgver=1.5.0
pkgrel=1
pkgdesc="A Pytest plugin which implements a few useful skip markers"
arch=(any)
url="https://github.com/saltstack/pytest-skip-markers"
license=(Apache-2.0)
depends=(
  python
  python-attrs
  python-distro
  python-pytest
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-declarative-requirements
  python-setuptools-scm
  python-toml
  python-wheel
)
checkdepends=(
  python-pyfakefs
  python-pytest-subtests
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('9736e224c05ec252c20a1dd2f596a03404bcbb89f725be74214192575f48bd24')
b2sums=('26575a1a7880714b3af4fd7b02b5c5d56b99e0ad0947012823e6c917afe7ca134e930f2bf75b3504fe3fd1516d39e82acd7dae799255b30c370ae085d0cff402')

build() {
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

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
    --deselect tests/functional/test_skip_if_binaries_missing.py::test_single_non_existing_with_deprecated_message
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
