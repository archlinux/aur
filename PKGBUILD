# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-metadata
pkgname=python-pytest-metadata
pkgver=3.1.0
pkgrel=1
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
sha512sums=('336e7f96569ca65fa7ad2dd04fb17071b5565813785e0446ad10d1e15fde6e5414aac7210aaa81e3d8d36f7960a7d448ece537a58aaacc0d3affacffcedbbc86')
b2sums=('86c7c6813295fa731b12a2d11e610813d612851ab16315f1b0dfcf48ad58f388617d9459a7c4bce59ee00e57b9b354f1f5be9d7d07bf03729e3ff77914f6d552')

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
