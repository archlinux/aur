# Contributor: WonderWoofy <sugar.and.scruffy@gmail.com>
# Contributor: rat4 <rat4vier@gmail.com>
# Maintainer: ultraviolet <ultravioletnanokitty@gmail.com>

_pkgname=thermald
pkgname=thermald-git
pkgver=v2.4.1.r6.g7c2ec23
pkgrel=1
pkgdesc="The Linux Thermal Daemon program from 01.org"
arch=('i686' 'x86_64')
url="https://github.com/intel/thermal_daemon"
license=('GPL2')
depends=('dbus-glib>=0.94' 'libxml2>=2.4')
backup=('etc/thermald/thermal-conf.xml')
makedepends=('git'
  'gtk-doc'
  'autoconf-archive')
conflicts=('thermald')
provides=('thermald')
source=("$_pkgname::git://github.com/intel/thermal_daemon.git"
		'modules-load-msr.conf')
md5sums=('SKIP'
         '3f8abd21c1be92e631fd9f557c61355b')


pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
  install -m644 ${srcdir}/${_pkgname}/data/thermal-conf.xml ${pkgdir}/etc/${_pkgname}/
}
