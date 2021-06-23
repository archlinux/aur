# Maintainer  : Matthias Fulz < mfulz [at] olznet [dot] de >

pkgname='gsa'
pkgver=21.4.0
pkgrel=1
pkgdesc='Greenbone Security Assistant'
arch=('x86_64')
url="https://github.com/greenbone/gsa"
license=('GPL')
depends=('gvm-libs-20' 'libgcrypt' 'gnutls' 'postgresql' 'libxml2' 'libmicrohttpd' 'openvas-scanner')
makedepends=('cmake' 'doxygen' 'xmltoman' 'nodejs' 'npm')
groups=('greenbone-vulnerability-manager')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/greenbone/gsa/archive/v${pkgver}.tar.gz"
        "gsad"
        "gsad.service")
sha512sums=('6301fc6bff1cc437c7cdc894bc0343095655d79648272e936bb2c01564353690d4995296e6b9a8bc2cb4ace6f9737c6d98e0ac8bf02cbd745df3bb9e65f87117'
            '73817d4a57e591b0102e9c0822a18a1b2ee76bf13df54f7928a0e8b343ca6c253e8e4bc4535b2dabd36094aade4c2bb5f4a96cf7edac04cbf4edcf2ba4c0c0f7'
            '6c65e3ea08b427cd1773c346b054b7b1a3e95d06d6d4070603e97f92b59f9dd465e94992cd6b5927192bc9b859c1268d1cda8d92d4067264389a7a0a578b9d30')

build() {
  cd "${pkgname}-${pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DSBINDIR=/usr/bin \
    -DCMAKE_INSTALL_PREFIX=/usr -DSYSCONFDIR=/etc -DLOCALSTATEDIR=/var .
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -d $pkgdir/usr/lib/systemd/system
  install -m 644 $srcdir/gsad.service $pkgdir/usr/lib/systemd/system
  install -d $pkgdir/etc/default
  install -m 644 $srcdir/gsad $pkgdir/etc/default
}
