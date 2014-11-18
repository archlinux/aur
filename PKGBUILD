# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-librabbitmq
pkgname=python2-librabbitmq
pkgver=1.6.1
pkgrel=1
pkgdesc="AMQP Client using the rabbitmq-c library"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/librabbitmq"
license=('MPL')
makedepends=('python2-setuptools' 'python2-amqp')
checkdepends=('python2-nose-cover3')
source=("http://pypi.python.org/packages/source/l/librabbitmq/librabbitmq-$pkgver.tar.gz")
md5sums=('716f05388d4747ea605c1a31f8541e3b')

check() {
  cd "$srcdir/librabbitmq-$pkgver"

  # unittest2 is not needed for Python 2.7
  sed -e "s/import unittest2 as unittest/import unittest/" \
      -i librabbitmq/tests/test_functional.py

  # Need a RabbitMQ to run the tests
  python2 setup.py test || warning "Tests failed"
}

package_python2-librabbitmq() {
  depends=('python2-amqp')

  cd "$srcdir/librabbitmq-$pkgver"
  python2 setup.py install -O1 --root="$pkgdir/"

  # Avoid conflicts
  cd "$pkgdir/usr/lib/python2.7/site-packages/"
  mv funtests librabbitmq/
}
