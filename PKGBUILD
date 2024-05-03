# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Neil Santos <nsantos16+aur@gmail.com>

_name=wsgi_intercept
pkgname=python-wsgi-intercept
pkgver=1.13.0
pkgrel=1
pkgdesc="Intercept socket connection to wsgi applications for testing"
arch=(any)
url="https://github.com/cdent/wsgi-intercept"
license=(MIT)
depends=(
  python
  python-six
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-sphinx
  python-wheel
)
checkdepends=(
  python-httplib2
  python-pytest
  python-requests
  python-urllib3
)
optdepends=(
  'python-httplib2: for intercepting requests of python-httplib2'
  'python-requests: for intercepting requests of python-requests'
  'python-urllib3: for intercepting requests of python-urllib3'
)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('cd887615c50be4d9dad7202f7d085ecf6dc2d469ab1e0d37ba49f380947efdc18b9b1b647d9657c58e822e67687324fbafd81efc8992579ebbfff40c944f558f')
b2sums=('db2b9b3d6079537c442f5d954e87d6c8571d9874483d23ee9d3b8a6f15d1148c0e5f45e020fb3489810894444ed6e9903fa731ae74461c08e0f0ae306ff84a83')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
  sphinx-build docs build/sphinx -b man
}

check() {
  cd $_name-$pkgver
  pytest -vv
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README -t "$pkgdir/usr/share/$pkgname/"
  install -vDm 644 build/sphinx/$_name.1 -t "$pkgdir/usr/share/man/man1/"
  rm -frv "$pkgdir/$site_packages/$_name/tests/"
}
