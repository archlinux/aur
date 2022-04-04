# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-metadata
pkgname=python-pytest-metadata
pkgver=2.0.1
pkgrel=1
pkgdesc="Plugin for accessing test session metadata"
arch=(any)
url="https://github.com/pytest-dev/pytest-metadata"
license=(MPL2)
depends=(python-pytest)
makedepends=(python-build python-installer python-poetry python-wheel)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('1dc27fa66aec03d1a2fcfa2b0c14a94c0bdca52c13df6e8f22a4a7d2fa7f91a054046c7f71d97277ee049f317fe1ff001f7122905b04bbe200611c842bcce2df')
b2sums=('95868ad0f26f84b3544610b4a3575c42f0aca665ac44861e8ecc240e4866c1409fca729be508791b19f9c78ab8fd7dcbf563ba183bbcea7b36c2e0a2061481c0')

build() {
  cd $_name-$pkgver
  python setup.py build
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
