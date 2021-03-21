# Maintainer  : Matthias Fulz < mfulz [at] olznet [dot] de >

pkgname='gsa'
pkgver=20.8.1
pkgrel=2
pkgdesc='Greenbone Security Assistant'
arch=('x86_64')
url="https://github.com/greenbone/gsa"
license=('GPL')
depends=('gvm-libs-20' 'libgcrypt' 'gnutls' 'postgresql' 'libxml2' 'libmicrohttpd' 'openvas-scanner' 'npm')
makedepends=('cmake' 'doxygen' 'xmltoman')
groups=('greenbone-vulnerability-manager')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/greenbone/gsa/archive/v${pkgver}.tar.gz"
        "gsad"
        "gsad.service")
sha512sums=('85a96d59317bedfbe748b02b71fcf5f931f049d1ca688e3d4e87e701f14cd39ec4320621689f3a9f6b91fc1cf4e25c422df4d9b4675a7bcfed330b431b64d3ef'
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
