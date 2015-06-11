# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Robert Knauer <robert@privatdemail.net>

pkgname=freediameter
pkgver=1.2.0
pkgrel=1
pkgdesc="An open source implementation of the diameter protocol"
arch=('i686' 'x86_64')
url="http://www.freediameter.net/"
license=('BSD')
depends=('gnutls' 'libidn')
makedepends=('cmake')
install="$pkgname.install"
source=("http://www.freediameter.net/hg/freeDiameter/archive/$pkgver.tar.gz"
        'freediameter.service')
sha256sums=('0601a7f559af6596dff8e18f5c9b17bc66de50d8e05640aa64a3403a841cb228'
            'd6bea4c108526222d1096a031eb8d1ff168eb73b0a22747a6efe85098759d52f')

build() {
  cd "$srcdir/freeDiameter-$pkgver"

  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DDEFAULT_CONF_PATH=/etc/freediameter \
    -DDISABLE_SCTP=ON

  make
}

package() {
  cd "$srcdir/freeDiameter-$pkgver"

  make DESTDIR="$pkgdir" install

# install systemd service file
  install -Dm644 "$srcdir/freediameter.service" "$pkgdir/usr/lib/systemd/system/freediameter.service"

# install configuration files
  install -dm755 "$pkgdir/etc/freediameter/samples/single_host/"
  install -m644 doc/*.{{conf,py}.sample,sql} "$pkgdir/etc/freediameter/samples/"
  install -m644 doc/single_host/* "$pkgdir/etc/freediameter/samples/single_host/"

# install license files
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
