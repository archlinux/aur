# Maintainer: Dringsim <dringsim@qq.com>
pkgname=php-zmq-git
pkgver=1.1.2.r106.g616b6c6
pkgrel=2
pkgdesc="ZeroMQ is a software library that lets you quickly design and implement a fast message-based applications. (Git version)"
url="https://github.com/mkoppanen/php-zmq"
arch=('x86_64')
license=('PHP')
depends=('php' 'zeromq')
makedepends=('gcc' 'git')
provides=("php-zmq")
conflicts=("php-zmq")
backup=('etc/php/conf.d/zmq.ini')
source=("git+https://github.com/zeromq/php-zmq.git"
  "use-zend_ce_exception-instead-of-zend_exception_get_default()-for-8.5.patch::https://github.com/zeromq/php-zmq/commit/94920ac64398901175dc4372a4297817122c52ce.patch")
sha256sums=("SKIP"
  "05e12019e4f2f078b08cbcdeb4b421f968e419ededc24e22b8e5b838bda8e39c")

pkgver() {
  cd "$srcdir/php-zmq"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/php-zmq"
  patch -p1 < "../../use-zend_ce_exception-instead-of-zend_exception_get_default()-for-8.5.patch"
}

build() {
  cd "$srcdir/php-zmq"

  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/php-zmq"

  make INSTALL_ROOT="$pkgdir" install

  echo 'extension=zmq.so' > zmq.ini 
  install -Dm644 zmq.ini "$pkgdir/etc/php/conf.d/zmq.ini"
}
