# Maintainer: Felix Singer

pkgname=murmur-snapshot-noice
pkgver=1.3.0_2389_gdde8173
pkgrel=1
pkgdesc="The voice chat application server for Mumble"
arch=('i686' 'x86_64')
url="https://mumble.info"
license=('BSD')
depends=('qt5-base' 'protobuf')
makedepends=('python' 'boost')
source=("https://mumble.info/snapshot/mumble-${pkgver//_/\~}~snapshot.tar.gz")
sha512sums=('18d0c2e8d0caeed1306429a367a2756260280a3bcc7ed8bac7c3a6e8b8938e6f13b65c83271f1411b948c50d20d7426aebaf14f271109df8c62209108157e374')

build() {
  cd $srcdir/mumble-${pkgver//_/\~}~snapshot

  qmake-qt5 main.pro \
    CONFIG+="no-client no-bonjour no-ice" \
    INCLUDEPATH+="/usr/include/openssl-1.0" \
    QMAKE_LFLAGS+="-L/usr/lib/openssl-1.0 -lssl -lcrypto"

  make release
}

package() {
  cd "${srcdir}/mumble-${pkgver//_/\~}~snapshot"

  cat release/murmurd release/libmumble_proto.a > "release/murmurd_new"

  install -m755 -D "./release/murmurd_new" "${pkgdir}/usr/bin/murmurd"
  install -m755 -d "${pkgdir}/usr/share/man/man1"
  install -m644 -D "./man/murmurd.1" "${pkgdir}/usr/share/man/man1/"
  install -m644 -D "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: sw=2:ts=2 et:
