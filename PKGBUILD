# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest_metadata
pkgname=python-pytest-metadata
pkgver=2.0.3
pkgrel=1
pkgdesc="Plugin for accessing test session metadata"
arch=(any)
url="https://github.com/pytest-dev/pytest-metadata"
license=(MPL2)
depends=(python-pytest)
makedepends=(python-build python-installer python-poetry-core python-wheel)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('17b1b88418f1a33926d6d4bf7b2a662d7848fa61f760dd6dab75e706197426e54b298976603b23f0882ca6315af447f7a22c90dd5691017bd70064f5527c0309')
b2sums=('9e0a58c26f3e5343f6694f45d55689c17313753733573a7c0ab9a972b222a0ec74f1d89c8a5810b3c56f6417b30e9caa9f2580af78d21a954aacec70098c229c')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
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
