# Maintainer: Maurizio Porrato <maurizio.porrato@gmail.com>

pkgname=janus-gateway
pkgver=0.6.2
pkgrel=1
pkgdesc="WebRTC gateway."
arch=('i686' 'x86_64')
url="http://janus.conf.meetecho.com/"
license=('GPL3')
depends=('libmicrohttpd' 'jansson' 'libnice' 'openssl' 'libsrtp'
         'sofia-sip' 'libusrsctp-git' 'libwebsockets' 'libevent' 
         'librabbitmq-c' 'opus' 'libogg' 'glib2' 'ding-libs' 'lua>=5.3')
makedepends=('gengetopt' 'paho-mqtt-c-git')
provides=(janus-gateway)
backup=('etc/janus/janus.cfg')
install=janus-gateway.install

source=("https://github.com/meetecho/janus-gateway/archive/v${pkgver}.tar.gz")
sha256sums=('d605c6482d170b760cf917d190a2681362422993070d45c3e368eb973560b17d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --disable-docs \
--enable-javascript-commonjs-module --enable-post-processing \
--enable-mqtt --enable-rabbit-mq
  DESTDIR="$pkgdir/" make
}

package() { 
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="$pkgdir/" make install configs
  rm -f "$pkgdir/usr/share/janus/certs/mycert.{key,pem}"
} 
