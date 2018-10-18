# Maintainer: Maurizio Porrato <maurizio.porrato@gmail.com>

pkgname=janus-gateway
pkgver=0.4.5
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
sha256sums=('fc60e615e0c70249e41a32e068ef8feed7e01478fb7659ae16b73c6dd08d695d')

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
