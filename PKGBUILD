# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Neil Santos <nsantos16+aur@gmail.com>

_name=wsgi_intercept
pkgname=python-wsgi-intercept
pkgver=1.11.0
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
sha512sums=('8fd0ff0eadc5a19831f089d34bbf879b58c79e27c340128298a4385578bbfd5e86a14f0168a418f5c8e40062b14993a577b07be02d29e954486b7e2a04597ee8')
b2sums=('3008837e8125c212920b0a5a6e6c0a65f279cf60a251bd853006b1e12774da80cbf737f1db5243a30cc9d510fedeb5e4127a81d3cb5210392cd5c561109a252b')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
  cd docs
  make man
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
  install -vDm 644 docs/_build/man/${_name}.1 -t "$pkgdir/usr/share/man/man1/"

  rm -frv "$pkgdir/$site_packages/$_name/tests/"
}
