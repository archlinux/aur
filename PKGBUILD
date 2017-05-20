# Maintainer: Felix Singer

_pkgname=murmur
pkgname=${_pkgname}-stable-minimal
pkgver=1.2.19
pkgrel=1
pkgdesc="The voice chat application server for Mumble"
arch=('i686' 'x86_64' 'armv7h')
url="https://mumble.info"
license=('BSD')
depends=('qt4' 'protobuf')
makedepends=('python' 'boost')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
install=murmur-stable-minimal.install
source=("https://github.com/mumble-voip/mumble/releases/download/${pkgver}/mumble-${pkgver}.tar.gz"
        "murmur.service"
        "murmur.logrotate"
        "murmur.conf.dbus")
sha512sums=('f91111194a899149b500a94afcf7cc5b9691c7ce8669f07fca2c66adbb3916ddb863bf703d04fb8387133fb75f3c8edb52974d1acf3febfafa1f73da19946de4'
            'SKIP'
            'SKIP'
            'SKIP')

build() {
  cd "${srcdir}/mumble-${pkgver}"

  qmake-qt4 main.pro \
    CONFIG+="no-client no-bonjour no-ice"

  make release
}

package() {
  murmur="${srcdir}/mumble-${pkgver}"

  install -m750 -d "${pkgdir}/etc/murmur"
  install -m640 -D "${murmur}/scripts/murmur.ini" "${pkgdir}/etc/murmur/murmur.ini"

  install -m755 -D "${murmur}/release/murmurd" "${pkgdir}/usr/bin/murmurd" 

  install -m644 -D "murmur.logrotate" "${pkgdir}/etc/logrotate.d/murmur"
  install -m644 -D "murmur.service" "${pkgdir}/usr/lib/systemd/system/murmur.service"
  install -m644 -D "murmur.conf.dbus" "${pkgdir}/etc/dbus-1/system.d/murmur.conf"

  install -m755 -d "${pkgdir}/usr/share/man/man1"
  install -m644 -D "${murmur}/man/murmurd.1" "${pkgdir}/usr/share/man/man1/"
  install -m644 -D "${murmur}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  sed -e "s|database=|database=/var/lib/murmur/murmur.sqlite|" \
      -e "s|#logfile=murmur.log|logfile=/var/log/murmur/murmur.log|" \
      -e "s|#pidfile=|pidfile=/run/murmur/murmur.pid|" \
      -e "s|#uname=|uname=murmur|" \
      -e "s|#sendversion=True|sendversion=False|" \
      -i "${pkgdir}/etc/murmur/murmur.ini"
}

# vim: sw=2:ts=2 et:
