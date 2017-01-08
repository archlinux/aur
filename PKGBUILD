# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: hadrons123 <piruthiviraj at gmail dot com>
# Contributor: WonderWoofy <sugar.and.scruffy@gmail.com>,wallnuss <v dot churavy at gmail dot com>

pkgname=thermald
_pkgname=thermal_daemon
pkgver=1.5.4
pkgrel=2
pkgdesc="The Linux Thermal Daemon program from 01.org"
arch=('i686' 'x86_64')
url="https://01.org/linux-thermal-daemon"
license=('GPL2')
makedepends=('systemd')
depends=('dbus-glib' 'libxml2')
backup=('etc/thermald/thermal-conf.xml')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/01org/${_pkgname}/archive/v${pkgver}.tar.gz"
        'modules-load-thermald.conf')
sha256sums=('42f72fc32c84adcbb2ee6667645c2e1653cdc4f85963e6f72efd83517f7c29f0'
            '0155e1eb459306d251a5a049ffc6c11e144fa8caa75901ac5fa20bd52e05d515')

build() {
  cd ${_pkgname}-${pkgver}
  ./autogen.sh
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --sbindir=/usr/bin
  make
}

package() {
  cd ${_pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}"/modules-load-thermald.conf "${pkgdir}"/usr/lib/modules-load.d/thermald.conf

  # Remove Upstart related files
  rm -r "${pkgdir}/etc/init"
}
