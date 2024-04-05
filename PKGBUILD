# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-metadata
pkgname=python-pytest-metadata
pkgver=3.1.1
pkgrel=2
pkgdesc="Plugin for accessing test session metadata"
arch=(any)
url="https://github.com/pytest-dev/pytest-metadata"
license=(MPL-2.0)
depends=(
  python
  python-pluggy
  python-pytest
)
makedepends=(
  python-build
  python-installer
  python-hatchling
  python-hatch-vcs
  python-wheel
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('bd6b0539158224ea2d21943e3a33bec81acafbe5a5d41ba5366f7b7342a728150511ab008f89ad3cb81ba886dc7f864fba809fcee209fe6e2a2ca322d2dc9db8')
b2sums=('bb29b4be24fbd2711daafb4a658aa244c8469e819fa596afc174680b2b444833dd0a2d29e3b56cb59f33fd76246fe019af61f87157eb7b155fc3f7c4bae69f2b')

build() {
  cd $_name-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  local _test_dir='test_dir'

  cd $_name-$pkgver
  # install to temporary location, as entrypoints are used
  python -m installer --destdir="$_test_dir" dist/*.whl
  export PYTHONPATH="$_test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
