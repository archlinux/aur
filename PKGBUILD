# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-librabbitmq
pkgver=2.0.0
_librabbitmqver=0.8.0
pkgrel=5
pkgdesc="AMQP Client using the rabbitmq-c library"
arch=('x86_64')
url="https://pypi.python.org/pypi/librabbitmq"
license=('MPL')
depends=('python-amqp' 'python-six')
makedepends=('python-setuptools')
checkdepends=('python-mock' 'pifpaf' 'rabbitmq')
source=("https://files.pythonhosted.org/packages/source/l/librabbitmq/librabbitmq-$pkgver.tar.gz"{,.asc}
        "librabbitmq-c-$_librabbitmqver.zip::https://github.com/alanxz/rabbitmq-c/archive/v$_librabbitmqver.zip")
sha512sums=('c35b815bc776bbac3087880406cb8dbcf6d3d8fad3590139d0dd88ae059599927f7a277493e6fd557ba2da6c9e8ee1a668f079bbb16f5127ccfd223afbd30a3f'
            'SKIP'
            'e386979ce1bc05c02cda06e8582981e0df25f9b31ca950f8a921bd2b249020f751ba65a6f38b8f5ba0be1b3e89492b29b72c6cd1d5ed3d6f19440799d6419ba6')
validpgpkeys=('0E54D05A3224273DC1B5435612A53B890119D176') # Omer Katz <omer.drow@gmail.com>

prepare() {
  (cd librabbitmq-$pkgver; ln -s ../rabbitmq-c-$_librabbitmqver ./rabbitmq-c)

  sed -i "s/'git'/'true'/" librabbitmq-$pkgver/setup.py
}

build() {
  CFLAGS+=' -fgnu89-inline'

  cd "$srcdir"/librabbitmq-$pkgver
  python setup.py build --with-librabbitmq=/usr
}

check() {
  cd "$srcdir"/librabbitmq-$pkgver
  pifpaf run rabbitmq --port 5672 python setup.py test
}

package() {
  cd librabbitmq-$pkgver
  python setup.py install -O1 --root="$pkgdir"
}
