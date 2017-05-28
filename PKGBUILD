# Maintainer: Felix Singer

_pkgname=murmur
pkgname=${_pkgname}-snapshot-minimal
pkgver=1.3.0_2407_g3754898
pkgrel=1
pkgdesc="The voice chat application server for Mumble"
arch=('i686' 'x86_64' 'armv7h')
url="https://mumble.info"
license=('BSD')
depends=('qt5-base' 'protobuf')
makedepends=('python' 'boost')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
install=murmur-snapshot-minimal.install
source=("https://mumble.info/snapshot/mumble-${pkgver//_/\~}~snapshot.tar.gz"
        "murmur.service"
        "murmur.logrotate"
        "murmur.conf.dbus")
sha512sums=('18d0c2e8d0caeed1306429a367a2756260280a3bcc7ed8bac7c3a6e8b8938e6f13b65c83271f1411b948c50d20d7426aebaf14f271109df8c62209108157e374'
            'SKIP'
            'SKIP'
            'SKIP')

build() {
  cd $srcdir/mumble-${pkgver//_/\~}~snapshot

  qmake-qt5 main.pro \
    CONFIG+="no-client no-bonjour no-ice" \
    INCLUDEPATH+="/usr/include/openssl-1.0" \
    QMAKE_LFLAGS+="-L/usr/lib/openssl-1.0 -lssl -lcrypto"

  make release
}

package() {
  murmur="${srcdir}/mumble-${pkgver//_/\~}~snapshot"

  cat ${murmur}/release/murmurd ${murmur}/release/libmumble_proto.a > "${murmur}/release/murmurd_new"

  install -m750 -d "${pkgdir}/etc/murmur"
  install -m640 -D "${murmur}/scripts/murmur.ini" "${pkgdir}/etc/murmur/murmur.ini"

  install -m755 -D "${murmur}/release/murmurd_new" "${pkgdir}/usr/bin/murmurd" 

  install -m644 -D "murmur.logrotate" "${pkgdir}/etc/logrotate.d/murmur"
  install -m644 -D "murmur.service" "${pkgdir}/usr/lib/systemd/system/murmur.service"
  install -m644 -D "murmur.conf.dbus" "${pkgdir}/etc/dbus-1/system.d/murmur.conf"
  
  install -m755 -d "${pkgdir}/usr/share/man/man1"
  install -m644 -D "${murmur}/man/murmurd.1" "${pkgdir}/usr/share/man/man1/"
  install -m644 -D "${murmur}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  sed -e "s|database=|database=/var/lib/murmur/murmur.sqlite|" \
      -e "s|;logfile=murmur.log|logfile=/var/log/murmur/murmur.log|" \
      -e "s|;pidfile=|pidfile=/run/murmur/murmur.pid|" \
      -e "s|;uname=|uname=murmur|" \
      -e "s|;sendversion=True|sendversion=False|" \
      -i "${pkgdir}/etc/murmur/murmur.ini"
}

# vim: sw=2:ts=2 et:
