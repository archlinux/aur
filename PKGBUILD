# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-skip-markers
pkgname=python-pytest-skip-markers
pkgver=1.4.1
pkgrel=1
pkgdesc="A Pytest plugin which implements a few useful skip markers"
arch=(any)
url="https://github.com/saltstack/pytest-skip-markers"
license=(Apache)
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
sha256sums=('da52e203a5ac3a495544ee65312549d519a9abff20269d06c06369e33ca5dfa3')
b2sums=('2abd097c529a6db51f36de6f5ac705da981e87196da4ccf99895b24277e9d4d717c80ebcf6b8d72959b7f76a10f23c2be11608c390845cca215472d2d4e99326')

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
