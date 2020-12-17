# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-flake8
pkgver=1.0.7
pkgrel=1
pkgdesc='pytest plugin to check FLAKE8 requirements'
arch=('any')
license=('MIT')
url='https://github.com/tholo/pytest-flake8'
depends=('python-pytest' 'flake8')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tholo/pytest-flake8/archive/$pkgver.tar.gz")
sha512sums=('c71d08eefcafe5503a660d8495c3520a9ae26ba701095c13111b33dc420fed03a2cbffa889eef08488ab5254ed001fd43b3a4757ffa2011cc3b4bd80d078f3c1')

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
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.9/site-packages:$PYTHONPATH" py.test
}

package() {
  cd pytest-flake8-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
