# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>

pkgbase=python-boto
pkgname=(python-boto python2-boto)
pkgver=2.46.1
pkgrel=1
pkgdesc='A Python interface to Amazon Web Services (AWS)'
arch=('any')
url='https://github.com/boto/boto'
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'git')
checkdepends=('python-nose' 'python2-nose' 'python-mock' 'python2-mock' 'python-requests'
              'python2-requests' 'python-httpretty' 'python2-httpretty')
source=("git+https://github.com/boto/boto.git#tag=$pkgver")
sha512sums=('SKIP')

prepare() {
  cp -a boto{,-py2}

  cd boto-py2
  # python2 fix
  find . -name '*.py' -type f -print0 | xargs -0 \
    sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_'
}

check() {
  cd boto
  # Known failure on test_correct_low_level_api_calls: https://bugs.python.org/issue25195
  python tests/test.py default || warning 'Tests failed'

  cd ../boto-py2
  python2 tests/test.py default
}

package_python-boto() {
  depends=('python')

  cd boto

  python setup.py install -O1 --root="$pkgdir"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Remove (somewhat deprecated) tools that conflicts with the python 2 version.
  rm -r "$pkgdir/usr/bin"
}

package_python2-boto() {
  depends=('python2')
  conflicts=('python-boto<2.32.1-1')
  replaces=('python-boto<2.32.1-1')

  cd boto-py2

  python2 setup.py install -O1 --root="$pkgdir"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
