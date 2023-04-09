# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-flask-jwt
pkgver=0.3.2
pkgrel=10
pkgdesc="JWT token authentication for Flask apps"
url="https://github.com/mattupstate/flask-jwt"
license=('MIT')
arch=('any')
depends=('python-flask' 'python-pyjwt')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mattupstate/flask-jwt/archive/$pkgver.tar.gz"
        pyjwt-2.0.0.patch)
sha512sums=('7c115ff4964da9a36303ac502dea98cd847abc3c1d45cd0be09b82ec761ee054d7ef97e25fd669112ab29dbfca00b4563914155ab1c8da4fc3d32f0063128b26'
            '4ec0a901263ac39bdb204bb684413617a5e1250536b07d03eb89fe489c58492b1960be0d3c429f908ea71e782563c0c3c6fcd76ec40fa7ae829c9a772355ed7f')

prepare() {
  cd flask-jwt-$pkgver
  # https://github.com/mattupstate/flask-jwt/issues/143
  patch -Np1 -i ../pyjwt-2.0.0.patch
  # Too old options
  sed -i 's/,<1.5.0//' requirements.txt
  echo > requirements-dev.txt
  rm setup.cfg
}

build() {
  cd flask-jwt-$pkgver
  python setup.py build
}

check() {
  cd flask-jwt-$pkgver
  python setup.py pytest
}

package() {
  cd flask-jwt-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
