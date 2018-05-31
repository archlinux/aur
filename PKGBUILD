# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-librabbitmq
pkgname=python2-librabbitmq
pkgver=1.6.1
pkgrel=2
pkgdesc="AMQP Client using the rabbitmq-c library"
arch=('x86_64')
url="https://pypi.python.org/pypi/librabbitmq"
license=('MPL')
makedepends=('python2-setuptools' 'python2-amqp')
checkdepends=('python2-nose-cover3')
source=("https://files.pythonhosted.org/packages/source/l/librabbitmq/librabbitmq-$pkgver.tar.gz")
sha512sums=('3989f01dca63c723cc7ec8b12ad029ef26e5fe52d37bb50c872030cf375386ad9a77bc84662d1798e7ef3c0246c62f704ca0d7a0a9f3ea937ec4d136ca7b8eb6')

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
