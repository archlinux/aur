# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-metadata
pkgname=python-pytest-metadata
pkgver=2.0.2
pkgrel=2
pkgdesc="Plugin for accessing test session metadata"
arch=(any)
url="https://github.com/pytest-dev/pytest-metadata"
license=(MPL2)
depends=(python-pytest)
makedepends=(python-build python-installer python-poetry-core python-wheel)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('2d07a20fafbc84ad308d4a2542df2dc245baf87bb3348047a2ebc0779d30c9c1f93522b66356a8a985619edfad0cff49b76e34ea46e0432a7568416830f33e16')
b2sums=('7b4b7b15509701e569e9e58df7bea9341c56a47a1e3d59eb3c51817e2956abf9bd0de70a189eafc7fa15fd49044791f9a60f66d705fcea0286dcf5fe29f0fc62')

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
