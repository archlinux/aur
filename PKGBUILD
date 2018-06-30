# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-flask-jwt
pkgname=(python-flask-jwt python2-flask-jwt)
pkgver=0.3.2
pkgrel=2
pkgdesc="JWT token authentication for Flask apps"
url="https://github.com/mattupstate/flask-jwt"
license=('MIT')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools' 'python-flask' 'python2-flask' 'python-pyjwt'
             'python2-pyjwt')
checkdepends=('python-pytest-runner' 'python2-pytest-runner')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/mattupstate/flask-jwt/archive/$pkgver.tar.gz")
sha512sums=('7c115ff4964da9a36303ac502dea98cd847abc3c1d45cd0be09b82ec761ee054d7ef97e25fd669112ab29dbfca00b4563914155ab1c8da4fc3d32f0063128b26')

prepare() {
  # Too old options
  sed -i 's/,<1.5.0//' flask-jwt-$pkgver/requirements.txt
  echo > flask-jwt-$pkgver/requirements-dev.txt
  rm flask-jwt-$pkgver/setup.cfg

  cp -a flask-jwt-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/flask-jwt-$pkgver
  python setup.py build

  cd "$srcdir"/flask-jwt-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/flask-jwt-$pkgver
  python setup.py pytest

  cd "$srcdir"/flask-jwt-$pkgver-py2
  python2 setup.py pytest
}

package_python-flask-jwt() {
  depends=('python-flask' 'python-pyjwt')

  cd flask-jwt-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-flask-jwt() {
  depends=('python2-flask' 'python2-pyjwt')

  cd flask-jwt-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
