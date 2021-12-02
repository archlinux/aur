# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-flake8
pkgver=1.0.7
pkgrel=3
pkgdesc='pytest plugin to check FLAKE8 requirements'
arch=('any')
license=('MIT')
url='https://github.com/tholo/pytest-flake8'
depends=('python-pytest' 'flake8')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tholo/pytest-flake8/archive/$pkgver.tar.gz"
        $pkgname-python310.patch::https://github.com/tholo/pytest-flake8/pull/82.patch)
sha512sums=('c71d08eefcafe5503a660d8495c3520a9ae26ba701095c13111b33dc420fed03a2cbffa889eef08488ab5254ed001fd43b3a4757ffa2011cc3b4bd80d078f3c1'
            '7b7e5793216ac2aef35ce96122b99ce63f4e2acbdf9ae5a6d8f5719cafa1e725ac3afa5d1421c106bc1ce3f6d2d6794ff2c98c67204194e4651fc170c52670f1')

prepare() {
  cd pytest-flake8-$pkgver
  patch -Np1 -i ../$pkgname-python310.patch
  sed -i 's/ignore = E128/ignore = E128 W605/' tox.ini
}

build() {
  cd "$srcdir"/pytest-flake8-$pkgver
  python setup.py build
}

check() {
  # Hack entry points by installing it

  cd "$srcdir"/pytest-flake8-$pkgver
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.10/site-packages:$PYTHONPATH" py.test
}

package() {
  cd pytest-flake8-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
