# This is the PKGBUILD for mosquitto, an MQTT broker and example clients

# Maintainer: Radek Podgorny <radek@podgorny.cz>
# Contributor: Dan Anderson <dan-anderson at cox dptnet>

pkgname=mosquitto
pkgver=1.4.9
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
sha256sums=('1df3ae07de40b80a74cd37a7b026895c544cdd3b42c9e0719ae91623aa98c58b'
            'SKIP'
            '5e41d486359879a2e139be0c7023909212b7abb2c560720a0b1f233ecdb5a8b6'
            '09b8a17fc59f36f40ead4644fffc95458a9255c32d4848f39ceca05925dcc95b'
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
