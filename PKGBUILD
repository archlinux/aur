# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-pytest-httpbin
pkgver=1.0.2
pkgrel=1
pkgdesc='A py.test fixture for httpbining code'
arch=('any')
license=('MIT')
url='https://github.com/kevin1024/pytest-httpbin'
depends=('python38-pytest' 'python38-six' 'httpbin')
checkdepends=('python38-requests')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kevin1024/pytest-httpbin/archive/v$pkgver.tar.gz"
        LICENSE)
sha512sums=('b4adac1c37506391d83f7772814b4a9ce5134cc6834d8758e71d39610f8b29e57e72b11b2233be51e41b2c36bc305d40fc4b260a7f83d10390f4e940df8aa366'
            '949cb93164ce92e0a5acc184cca2da5580e31def2d153771ebfa386030fa2da65bcd48670780096d2cefe3e631dc755fc3024ae417f2d1bb3333bd85a39baf22')

build() {
  cd pytest-httpbin-$pkgver
  python3.8 setup.py build
}

check() {
  # Hack entry points by installing it
  # https://github.com/kevin1024/pytest-httpbin/issues/64

  cd pytest-httpbin-$pkgver
  python3.8 setup.py install --root="$PWD/tmp_install" --optimize=1
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.8/site-packages:$PYTHONPATH" pytest --deselect tests/test_server.py::test_redirect_location_is_https_for_secure_server
}

package() {
  cd pytest-httpbin-$pkgver
  python3.8 setup.py install --root="$pkgdir"/ --optimize=1
  install -D -m644 ../LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
