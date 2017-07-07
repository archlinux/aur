# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>

pkgbase=python-boto
pkgname=(python-boto python2-boto)
pkgver=2.48.0
pkgrel=1
pkgdesc='A Python interface to Amazon Web Services (AWS)'
arch=('any')
url='https://github.com/boto/boto'
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-nose' 'python2-nose' 'python-mock' 'python2-mock' 'python-requests'
              'python2-requests' 'python-httpretty' 'python2-httpretty')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/boto/boto/archive/$pkgver.tar.gz")
sha512sums=('aabef7622927884549fbc1cb3b39d307aadcab0ac5bff65778f87c881a8df76ee819aab20c34d5aceb62fe1365629f9186b8e10f3216b62d9a339a93e9b5f12a')

prepare() {
  cp -a boto-$pkgver{,-py2}

  cd boto-$pkgver-py2
  # python2 fix
  find . -name '*.py' -type f -print0 | xargs -0 \
    sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_'
}

check() {
  cd "$srcdir"/boto-$pkgver
  # Known failure on test_correct_low_level_api_calls: https://bugs.python.org/issue25195
  python tests/test.py default || warning 'Tests failed'

  cd "$srcdir"/boto-$pkgver-py2
  python2 tests/test.py default
}

package_python-boto() {
  depends=('python')

  cd boto-$pkgver

  python setup.py install -O1 --root="$pkgdir"
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  # Remove (somewhat deprecated) tools that conflicts with the python 2 version.
  rm -r "$pkgdir"/usr/bin
}

package_python2-boto() {
  depends=('python2')
  conflicts=('python-boto<2.32.1-1')
  replaces=('python-boto<2.32.1-1')

  cd boto-$pkgver-py2

  python2 setup.py install -O1 --root="$pkgdir"
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
