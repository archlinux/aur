# This is the PKGBUILD for mosquitto, an MQTT broker and example clients

# Maintainer: Tomáš Mládek <tmladek{at}inventati{dt}org> 
# Contributor: Dan Anderson <dan-anderson at cox dptnet>

pkgname=mosquitto
pkgver=1.4.2
pkgrel=1
pkgdesc="An Open Source MQTT v3.1 Broker"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="http://mosquitto.org/"
depends=('openssl' 'c-ares')
makedepends=('python' 'docbook-xsl' 'c-ares')
conflicts=('mosquitto-hg')
provides=('mosquitto')
license=('BSD')
source=(http://mosquitto.org/files/source/$pkgname-$pkgver.tar.gz{,.asc} "$pkgname.service" "$pkgname.install" "usr_move.patch")
install=$pkgname.install
sha256sums=('5ebc3800a0018bfbec62dcc3748fb29f628df068acd39c62c4ef651d9276647e'
         'SKIP'
         'b09c9852b5b438bad8dd54b3ac665bb0d05d1a9e4daf8c920956457c83622b64'
         '877ce99413301b0525f40adb5322dc50e69e2f90092138bf495c393dec65d449'
         'c436bcc5a61d923ab36d5b3f24e5f628bf18ef14c2f351633d58ca983b5f655c')
validpgpkeys=('A0D6EEA1DCAE49A635A3B2F0779B22DFB3E717B7')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  patch -p1 < ../usr_move.patch

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make prefix=/usr DESTDIR="$pkgdir/" install

  # systemd service file
  install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  echo 'pid_file /run/mosquitto.pid' >> "$pkgdir/etc/mosquitto/mosquitto.conf.example"

  # license files
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
