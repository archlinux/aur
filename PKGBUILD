# This is the PKGBUILD for mosquitto, an MQTT broker and example clients

# Maintainer: Radek Podgorny <radek@podgorny.cz>
# Contributor: Dan Anderson <dan-anderson at cox dptnet>

pkgname=mosquitto
pkgver=1.4.9
pkgrel=3
pkgdesc="An Open Source MQTT v3.1 Broker"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="http://mosquitto.org/"
depends=('openssl' 'c-ares' 'libwebsockets')
makedepends=('python' 'docbook-xsl' 'c-ares')
license=('BSD')
source=(
  http://mosquitto.org/files/source/$pkgname-$pkgver.tar.gz{,.asc}
  "$pkgname.service"
  "$pkgname.install"
)
install=$pkgname.install
backup=("etc/$pkgname/$pkgname.conf")
sha256sums=('1df3ae07de40b80a74cd37a7b026895c544cdd3b42c9e0719ae91623aa98c58b'
            'SKIP'
            '3480aa1a9da543230fbbb0e7e11cde9db2736e486cd024fbd505f927188fa3a2'
            '4eee01f9b95000e5f1964dd32856d9c4fb0bf3c64ebfce34967ce903bd37d820')
validpgpkeys=('A0D6EEA1DCAE49A635A3B2F0779B22DFB3E717B7')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's|/sbin|/bin|g' src/Makefile
  make WITH_WEBSOCKETS=yes
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make prefix=/usr DESTDIR="$pkgdir/" install

  install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  mv "$pkgdir/etc/$pkgname/$pkgname.conf.example" "$pkgdir/etc/$pkgname/$pkgname.conf"
}
