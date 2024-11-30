# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-skip-markers
pkgname=python-pytest-skip-markers
pkgver=1.5.2
pkgrel=2
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
sha256sums=('b081a66020b2573eebe3a74b5936e3fe0ebbd64a581a71e8afba6c452a739af4')
b2sums=('51eb60d13a4b91030f68cf95cf1cb1987cc77bc105355fbceb289e73412f577347ba0340403e32b7930c08945b4d0292b7eededc84e8a5932c457073c823be1e')

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
