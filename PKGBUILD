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
sha512sums=('c23b4aabc59f11fe93074459d8343f587275771268d9c71c871da6bb46d8533a46ab9ac0b495c22771d9064288872abfd3180e3bc92dbe5842cff53046e543d6'
            '3aff2d9cf1396f8dd165addfebfd1f7354051c6f7e1bfbd920fde05d402d9315eecc9bcbf19bd3f45b54b3cea6b421ba002b76540865f227e0a3d1ebdf655824')

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
