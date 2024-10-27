# Maintainer: Kino <cybao292261@163.com>
# Contributor: Francisco Salces Carcoba <pacosalces@gmail.com>
pkgname=python-allantools
_name=AllanTools
pkgver=2024.06
pkgrel=1
pkgdesc="A python library for calculating Allan deviation and related time & frequency statistics."
license=("LGPL-3.0-only")
url="https://github.com/aewallin/allantools"
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
depends=('python-numpy' 'python-scipy' 'python-matplotlib')
checkdepends=('python-pytest')
source=("$_name-$pkgver.tar.gz::https://github.com/aewallin/allantools/archive/$pkgver.tar.gz")
sha256sums=('ada86ec16fc1190f0893fd92af357f3770eb799f6442c7d475d043b29fdfe911')
arch=('any')

prepare() {
	cd "$srcdir"/allantools-$pkgver
  sed -i "s|simpson(integrand, f)|simpson(integrand, x=f)|g" allantools/allantools.py
}

build() {
	cd "$srcdir"/allantools-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir"/allantools-$pkgver
  python -m venv venv --system-site-packages
  source venv/bin/activate
  $PWD/venv/bin/python -m installer dist/*.whl
  $PWD/venv/bin/python -m pytest
  deactivate
}

package() {
	cd "$srcdir"/allantools-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
