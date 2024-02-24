# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-shell-utilities
pkgname=python-pytest-shell-utilities
pkgver=1.8.0
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
  python-typing-extensions
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
sha256sums=('15990e9af65a5b43a9f205b716e1c8eff597b503bd67541fe7884d4914a6b707')
b2sums=('830e481996347a45aac357da8f98c8e9ee091a2bfd84af01a853abacde7fb9e10c451742cc8aa60cb8fed71e8176e43d95e17fbdd870f3f490334f5f6860e936')

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
