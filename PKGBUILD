# Maintainer: wolftankk <wolftankk@gmail.com>
pkgname=php-zmq
pkgver=1.1.3
pkgrel=1
pkgdesc="ZeroMQ is a software library that lets you quickly design and implement a fast message-based applications."
url="https://github.com/mkoppanen/php-zmq"
arch=('x86_64' 'i686')
[[ $CARCH == 'i686' ]] && cd _arch=32bits || _arch=64bits
license=('PHP')
depends=('php' 'zeromq')
makedepends=('gcc')
backup=('etc/php/conf.d/zmq.ini')

source=(
	"https://pecl.php.net/get/zmq-$pkgver.tgz"
)

sha256sums=('c492375818bd51b355352798fb94f04d6828c6aeda41ba813849624af74144ce')

build() {
  cd "$srcdir/zmq-$pkgver"

  #Clean current compilation
  if [ -f Makefile ]; then
	  make clean
	  phpize --clean
  fi

  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/zmq-$pkgver"

  make INSTALL_ROOT="$pkgdir" install

  echo 'extension=zmq.so' > zmq.ini 
  install -Dm644 zmq.ini "$pkgdir/etc/php/conf.d/zmq.ini"
}
