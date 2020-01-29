# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-pynamodb
pkgver=4.3.1
pkgrel=1
pkgdesc="A pythonic interface to Amazon's DynamoDB"
arch=(any)
url='https://pynamodb.readthedocs.io/'
license=(MIT)
makedepends=(python-setuptools)
depends=(python-botocore python-dateutil python-six)
checkdepends=(python-blinker python-mock python-pytest-mock python-requests)
source=("https://github.com/pynamodb/PynamoDB/archive/$pkgver/PynamoDB-$pkgver.tar.gz")
sha256sums=('38069836c0d133b75dcf4f7209b3c9bf88e24c39e175c1d9f2e1a38ab8950e5a')

build() {
  cd PynamoDB-$pkgver
  python setup.py build
}

check() {
  cd PynamoDB-$pkgver

  export AWS_SECRET_ACCESS_KEY=fake_key
  export AWS_ACCESS_KEY_ID=fake_id

  pytest -v -m 'not ddblocal' tests
}

package() {
  cd PynamoDB-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  rm -rv "$pkgdir"/usr/lib/python*/site-packages/tests

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
