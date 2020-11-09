# Maintainer: Ian Young <ian at iangreenleaf dot com>

pkgname=gigalixir-cli
pkgver=1.2.0
pkgrel=2
epoch=
pkgdesc="CLI tool for Gigalixir hosting service"
arch=('any')
url="https://www.gigalixir.com/"
license=('MIT')
depends=('python'
  'python-click'
  'python-requests'
  'python-stripe'
  'python-rollbar'
  'python-pygments')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner'
  'python-httpretty'
  'python-sure')
source=("https://github.com/gigalixir/$pkgname/archive/v$pkgver.tar.gz"
  "gigalixir_test.patch")
sha256sums=("b536afcc8bb96cadf8d9172180450677d2146fdbd4bc43cc4245d04210e3eabf"
  "4a5164f799d7206057a6438c3bf8909a9142c3350f250b5cd12951711bdcceeb")

check() {
  cd "$srcdir/$pkgname-$pkgver"
  GIGALIXIR_ENV=test python setup.py test
}

prepare() {
  cd "$pkgname-$pkgver"
  sed -e 's/stripe~=1.51/stripe>=1.28/g' -i setup.py
  sed -e 's/~=/>=/g' -i setup.py
  patch --strip=1 < ../gigalixir_test.patch
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
