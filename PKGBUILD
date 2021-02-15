# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-pynamodb
pkgver=5.0.2
pkgrel=1
pkgdesc="A pythonic interface to Amazon's DynamoDB"
arch=(any)
url='https://pynamodb.readthedocs.io/'
license=(MIT)
makedepends=(python-setuptools)
depends=(python-botocore)
checkdepends=(python-blinker python-pytest-mock)
optdepends=(
  'python-blinker: for signals'
)
source=("https://github.com/pynamodb/PynamoDB/archive/$pkgver/PynamoDB-$pkgver.tar.gz")
sha256sums=('7f9fdeb9a0ce6b05386c7ba35eb916630cbca0b9b560f15843996bf316b447b6')

build() {
  cd PynamoDB-$pkgver
  python setup.py build
}

check() {
  cd PynamoDB-$pkgver

  # Copied from upstream pytest.ini as pytest-env is not yet packaged
  export AWS_ACCESS_KEY_ID=1
  export AWS_SECRET_ACCESS_KEY=2

  pytest -m 'not ddblocal' tests
}

package() {
  cd PynamoDB-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
