# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>

pkgbase=python-boto
pkgname=(python-boto python2-boto)
pkgver=2.49.0
pkgrel=2
pkgdesc='A Python interface to Amazon Web Services (AWS)'
arch=('any')
url='https://github.com/boto/boto'
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-nose' 'python2-nose' 'python-mock' 'python2-mock' 'python-requests'
              'python2-requests' 'python-httpretty' 'python2-httpretty')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/boto/boto/archive/$pkgver.tar.gz")
sha512sums=('43c2679f33ecec9b78d9969329d361cff4fd569b431e8451d849a42882ba4913598bfc7e11561fc54799e6e36e6e75a0299da955232435fb3e56745b2fcb57bc')

prepare() {
  cp -a boto-$pkgver{,-py2}

  cd boto-$pkgver-py2
  # python2 fix
  find . -name '*.py' -type f -print0 | xargs -0 \
    sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_'
}

check() {
  cd "$srcdir"/boto-$pkgver
  python tests/test.py default

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
