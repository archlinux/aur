# Maintainer:  Ainola
# Contributor: Milan Knizek <knizek@volny.cz>

pkgname=scanbd
pkgver=1.4.3
pkgrel=2
pkgdesc="Scanner button daemon looking for scanner button pressed"
arch=('i686' 'x86_64')
url="http://scanbd.sourceforge.net/"
license=('GPL2')
depends=('sane' 'confuse')
source=("http://downloads.sourceforge.net/scanbd/scanbd-${pkgver}.tgz")
sha256sums=('0c7d04a3e2d196021d866390b2c95c7cb00ee2554488e616264a55bcec16b6d8')
install=scanbd.install
backup=('etc/scanbd/scanbd.conf')

## Note that original scanbd documentation is based on --prefix=/usr/local
## This package uses standard hierarchy (/usr, /etc)

build() {
  cd "${srcdir}/${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin
  make
}

package() {
  cd "${srcdir}/${pkgver}"
  make DESTDIR="$pkgdir" install

  install -d "${pkgdir}/etc/dbus-1/system.d"
  install -m644 integration/scanbd_dbus.conf "${pkgdir}/etc/dbus-1/system.d"
  sed -i 's@<policy user="saned">@<policy user="nobody">@' "${pkgdir}/etc/dbus-1/system.d/scanbd_dbus.conf"

  install -d "${pkgdir}/usr/lib/systemd/system"
  install -m644 integration/systemd/scanbd.service  "${pkgdir}/usr/lib/systemd/system"
  sed -i 's@\(Environment=SANE_CONFIG_DIR=/etc/scanbd\)$@\1/sane.d@' "${pkgdir}/usr/lib/systemd/system/scanbd.service"

  install -m644 integration/systemd/scanbm@.service "${pkgdir}/usr/lib/systemd/system"
  sed -i 's@\(User=\)saned@\1nobody@'                                "${pkgdir}/usr/lib/systemd/system/scanbm@.service"
  sed -i 's@\(Group=\)saned@\1scanner@'                              "${pkgdir}/usr/lib/systemd/system/scanbm@.service"
  sed -i 's@\(Environment=SANE_CONFIG_DIR=/etc/scanbd\)$@\1/sane.d@' "${pkgdir}/usr/lib/systemd/system/scanbm@.service"
 
  install -m644 integration/systemd/scanbm.socket   "${pkgdir}/usr/lib/systemd/system"

  install -d "${pkgdir}/usr/share/dbus-1/system-services"
  install -m644 integration/systemd/de.kmux.scanbd.server.service "${pkgdir}/usr/share/dbus-1/system-services"

  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 doc/README.txt AUTHORS "${pkgdir}/usr/share/doc/${pkgname}"

  install -d "${pkgdir}/etc/scanbd/sane.d"

  sed -i 's@\(        user    = \)saned$@\1nobody@' "${pkgdir}/etc/scanbd/scanbd.conf"
  sed -i 's@\(        group   = \)lp$@\1scanner@'   "${pkgdir}/etc/scanbd/scanbd.conf"
  sed -i 's@/var\(/run/scanbd.pid\)@\1@'            "${pkgdir}/etc/scanbd/scanbd.conf"
  sed -i 's@\(debug-level =\)7$@\1 2@'              "${pkgdir}/etc/scanbd/scanbd.conf"
  sed -i 's@\(SANE_CONFIG_DIR=\)\(/etc/scanbd\)@\1\2/sane.d@'  "${pkgdir}/etc/scanbd/scanbd.conf"
}

