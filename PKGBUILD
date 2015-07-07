# Contributor: WonderWoofy <sugar.and.scruffy@gmail.com>
# Contributor: rat4 <rat4vier@gmail.com>
# Maintainer: ultraviolet <ultravioletnanokitty@gmail.com>

_pkgname=thermald
pkgname=thermald-git
pkgver=1.4.2
pkgrel=1
pkgdesc="The Linux Thermal Daemon program from 01.org"
arch=('any')
url="https://github.com/01org/thermal_daemon"
license=('GPL2')
depends=('dbus-glib>=0.94' 'libxml2>=2.4')
backup=('etc/thermald/thermal-conf.xml')
makedepends=('git')
conflicts=('thermald')
provides=('thermald')
source=("$_pkgname::git://github.com/01org/thermal_daemon.git"
		'modules-load-msr.conf')
md5sums=('SKIP'
         '3f8abd21c1be92e631fd9f557c61355b')


pkgver() {
  cd $_pkgname
  git describe --always | sed -e 's|-|.|g' -e 's|v||'
}

build() {
  cd $_pkgname
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
  mkdir -p ${pkgdir}/usr/lib/modules-load.d
  install -m644 ${srcdir}/modules-load-msr.conf ${pkgdir}/usr/lib/modules-load.d/thermald.conf
}
