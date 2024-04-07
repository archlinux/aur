# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-pynamodb
# https://pynamodb.readthedocs.io/en/latest/release_notes.html
# https://github.com/pynamodb/PynamoDB/releases
# UPDATE_BLOCKED: breaks python-aws-xray-sdk
pkgver=5.5.1
pkgrel=2
pkgdesc="A pythonic interface to Amazon's DynamoDB"
arch=(any)
url='https://pynamodb.readthedocs.io/'
license=(MIT)
makedepends=(python-setuptools)
depends=(python python-botocore)
checkdepends=(python-blinker python-pytest-env python-pytest-mock)
optdepends=(
  'python-blinker: for signals'
)
source=("https://github.com/pynamodb/PynamoDB/archive/$pkgver/PynamoDB-$pkgver.tar.gz"
        "pytest-7.2.patch")
sha256sums=('fdd9d7fec4874e998e3a7148a147ce4a59bc03123c08b048d944a191e5ea605a'
            '9b9950dadcc236ac259afeeaf19f7386a77542c5db75658218b6958ddf7bb4c4')

prepare() {
  cd PynamoDB-$pkgver
  # Backport a fix for newer pytest, which leads to a warning since pytest 7.2 and an error since pytest 8
  # See: https://github.com/pynamodb/PynamoDB/pull/1109
  # Note that the relevant commit is already part of the latest stable release (6.0.0), but we cannot upgrade
  # due to python-aws-xray-sdk as mentioned above
  patch -Np1 -i ../pytest-7.2.patch
}

build() {
  cd PynamoDB-$pkgver
  python setup.py build
}

check() {
  cd PynamoDB-$pkgver
  pytest -m 'not ddblocal' tests
}

package() {
  cd PynamoDB-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
