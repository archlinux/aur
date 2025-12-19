# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-shell-utilities
pkgname=python-pytest-shell-utilities
pkgver=1.9.7
pkgrel=3
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
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz
        https://github.com/saltstack/pytest-shell-utilities/commit/c8edc1e1.patch)
sha256sums=('a175b0c1a907a4f97f2b6a014c56bf1199e15058a1588f23bece6cc060621b03'
            '5bf7ac63efe549c96b339f19c8837b8e2842d4d50595ab88ec01ee43f7bc3700')
b2sums=('f74fdfc24acd521313b2cc98bfcaaf916ff649a88b10c642edb8af785f7c473fbc97d80badec5e7da5b27a6394c6c16e6c354e8261cdfa94cb48ef3eb7174940'
        '8a780d166d3e2745a96c837ec3f72ffb2efec422ea4a3380dc75fe0f4c7314bc84ab28fde2a3caaab71f67a89bb7443157b44cf84c061e0afac031b21044ee1b')

prepare() {
  cd $_name-$pkgver
  patch -p1 -i ../c8edc1e1.patch # Fix tests with python 3.14
}

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
