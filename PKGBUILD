# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-shell-utilities
pkgname=python-pytest-shell-utilities
pkgver=1.9.6
pkgrel=1
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
sha256sums=('184383cc1de2c1fd26d42f165ee50cacb3566f3b6f295cedabdd21e1f07d5a93')
b2sums=('95c701ffd7b43356f3369d2bab3a8a6aee116b51dd2b78a9fe0e2defe6d86910c69222074ffbd23f6f6aa21f04613f168b9635b481f6b1646f8d8eaf707c9e5e')

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
