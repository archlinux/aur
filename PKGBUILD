# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-flake8
pkgver=1.0.5
pkgrel=1
pkgdesc='pytest plugin to check FLAKE8 requirements'
arch=('any')
license=('MIT')
url='https://github.com/tholo/pytest-flake8'
depends=('python-pytest' 'flake8')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tholo/pytest-flake8/archive/$pkgver.tar.gz")
sha512sums=('87caa4e80dfd3148ae2c92f863f2ffd1f6561bf5f09fca477cb41aabfbc7af1fee1356a57bcb830e3f2d2976d29bca78ce5700bd8b36e09a6e0fe08f2464f13e')

prepare() {
  sed -i 's/ignore = E128/ignore = E128 W605/' pytest-flake8-$pkgver/tox.ini
}

build() {
  cd "$srcdir"/pytest-flake8-$pkgver
  python setup.py build
}

check() {
  # Hack entry points by installing it

  cd "$srcdir"/pytest-flake8-$pkgver
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.8/site-packages:$PYTHONPATH" py.test
}

package() {
  cd pytest-flake8-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
