# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Robert Knauer <robert@privatdemail.net>

pkgname=freediameter
pkgver=1.5.0
pkgrel=1
pkgdesc="An open source implementation of the diameter protocol"
arch=('i686' 'x86_64')
url="http://www.freediameter.net/"
license=('BSD')
depends=('gnutls' 'libidn')
makedepends=('cmake')
install="$pkgname.install"
source=("https://github.com/freeDiameter/freeDiameter/archive/refs/tags/$pkgver.tar.gz"
        'freediameter.service')
sha256sums=('cc4ceafd9d0d4a6a5e3aa02bf557906fe755df9ec14d16c4fcd5dab6930296aa'
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
