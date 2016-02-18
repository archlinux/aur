# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>
# Contributor: hadrons123 <piruthiviraj at gmail dot com>
# Contributor: WonderWoofy <sugar.and.scruffy@gmail.com>,wallnuss <v dot churavy at gmail dot com>

pkgname=thermald
_pkgname=thermal_daemon
pkgver=1.5.1
pkgrel=1
pkgdesc="The Linux Thermal Daemon program from 01.org"
arch=('i686' 'x86_64')
url="https://github.com/01org/${_pkgname}"
license=('GPL2')
makedepends=('systemd')
depends=('dbus-glib>=0.94' 'libxml2>=2.4')
backup=('etc/thermald/thermal-conf.xml')
conflicts=('thermald')
provides=('thermald')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        'modules-load-thermald.conf')
sha512sums=('b9f0bc4775376f15e63d06f171535e631f065d54da276a2910413bb2358434abbec3285c5cc1a41aa38389ebb2a702f1552308f89cf50fcb2e72fe93d1ead5fe'
            '3aff2d9cf1396f8dd165addfebfd1f7354051c6f7e1bfbd920fde05d402d9315eecc9bcbf19bd3f45b54b3cea6b421ba002b76540865f227e0a3d1ebdf655824')

build() {
  cd "${_pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --sbindir=/usr/bin
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/modules-load-thermald.conf" "${pkgdir}/usr/lib/modules-load.d/thermald.conf"

  # Remove Upstart related files
  rm -r "${pkgdir}/etc/init"
}
