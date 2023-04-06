# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest_metadata
pkgname=python-pytest-metadata
pkgver=2.0.4
pkgrel=2
pkgdesc="Plugin for accessing test session metadata"
arch=(any)
url="https://github.com/pytest-dev/pytest-metadata"
license=(MPL2)
depends=(python-pytest)
makedepends=(python-build python-installer python-poetry-core python-wheel)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('6947c9dd4d1a30cb5bcbfe24b10c4c8b077c64fd34faf5e24556be59b64d262c7c16eb1a5e8dcc78adbef8f25cf5a18ebfa23ff1d9296c1f80f0e3d7eadcc939')
b2sums=('a67159a5d4ec229a5a4419fbed251e7e13126fea92feacce3ea06d3299f7fea3489253d4c380ce23fff1c9b86bc140f1143196a249a53680743c95507f909656')

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
