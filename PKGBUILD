# Maintainer: Maurizio Porrato <maurizio.porrato@gmail.com>

pkgname=janus-gateway
pkgver=0.7.3
pkgrel=1
pkgdesc="WebRTC gateway."
arch=('i686' 'x86_64')
url="http://janus.conf.meetecho.com/"
license=('GPL3')
depends=('libmicrohttpd' 'jansson' 'libnice' 'openssl' 'libsrtp' 'libconfig'
         'sofia-sip' 'libusrsctp-git' 'libwebsockets' 'libevent' 
         'librabbitmq-c' 'opus' 'libogg' 'glib2' 'ding-libs' 'lua>=5.3' 'ffmpeg')
makedepends=('gengetopt' 'paho-mqtt-c-git')
provides=(janus-gateway)
backup=('etc/janus/janus.cfg')
install=janus-gateway.install

source=("https://github.com/meetecho/janus-gateway/archive/v${pkgver}.tar.gz"
janus.service)
sha256sums=('d34868c259f388105fe16a5cd304a5684d45b1eddbe436293f4aa2178c0e4b6e'
            'cf2b6c8fdcd60ccfa179c4cd207a23ee7edfee90588c2c3847aa6cda418bed7f')
_userid=531

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --disable-docs \
--enable-javascript-commonjs-module --enable-post-processing \
--enable-mqtt --enable-rabbit-mq
  DESTDIR="$pkgdir/" make

  # make sysusers file to run as user janus
  echo "u janus $_userid \"Janus WebRTC gateway user\" /var/lib/janus /bin/bash" > "$srcdir/janus.conf"
}

package() { 
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="$pkgdir/" make install configs
  rm -f "$pkgdir/usr/share/janus/certs/mycert.{key,pem}"

  # install systemd unit file to run as user janus
  install -dm0700 -o "$_userid" -g "$_userid" "${pkgdir}/var/lib/janus"
  install -Dm644 "$srcdir/janus.service" -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm644 "$srcdir/janus.conf" -t "${pkgdir}"/usr/lib/sysusers.d/
} 
