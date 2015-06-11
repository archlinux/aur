# Maintainer: hadrons123 <piruthiviraj at gmail dot com>
# Contributor: WonderWoofy <sugar.and.scruffy@gmail.com>,wallnuss <v dot churavy at gmail dot com>

pkgname=thermald
_pkgname=thermal_daemon
pkgver=1.4.2
pkgrel=1
pkgdesc="The Linux Thermal Daemon program from 01.org"
arch=('i686' 'x86_64')
url='https://github.com/01org/thermal_daemon'
license=('GPL2')
makedepends=('systemd')
depends=('dbus-glib>=0.94' 'libxml2>=2.4')
backup=('etc/thermald/thermal-conf.xml')
conflicts=('thermald')
provides=('thermald')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        'modules-load-thermald.conf')
sha256sums=('4be5e1105f8b24af17d19357eda97b6edd3d74284c3ee762060d487158997f8b'
            '0155e1eb459306d251a5a049ffc6c11e144fa8caa75901ac5fa20bd52e05d515')

build() {
  cd "${_pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
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
