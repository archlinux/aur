# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-shell-utilities
pkgname=python-pytest-shell-utilities
pkgver=1.9.0
pkgrel=2
pkgdesc="Pytest plugin providing fixtures and code to help with running shell commands on tests"
arch=(any)
url="https://github.com/saltstack/pytest-shell-utilities"
license=(Apache-2.0)
depends=(
  python
  python-attrs
  python-packaging  # direct dependency but pulled in via python-pytest
  python-pytest
  python-pytest-helpers-namespace
  python-pytest-skip-markers
  python-psutil
  python-typing_extensions
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
checkdepends=(python-pytest-subtests)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('d4b4f22395cf180056e49d537a8374537b1c7287ccdddefc0e7be5cbdbd0b46c')
b2sums=('e17b3903b8b3b9c2a8b3d708a1031c5b18beb4741006cec5cf2b8586fb1a86c0034e374927f09786dd036d01ae8811f4eacdaa28053d3205d19bb122211b6437')

build() {
  cd $_name-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGELOG,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
