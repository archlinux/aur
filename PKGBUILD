# Maintainer: Zezadas <aur at sefod dot eu>
# Forked from https://aur.archlinux.org/packages/thermald/ 

pkgname=thermald-git-gcc10
pkgver=v2.1.r2.g3f3cdc3
pkgrel=1
pkgdesc="The Linux Thermal Daemon program from 01.org"
arch=('x86_64')
url="https://01.org/linux-thermal-daemon"
license=('GPL2')
makedepends=('systemd' 'python' 'autoconf-archive' 'gtk-doc')
depends=('dbus-glib' 'libxml2')
conflicts=('thermald')
provides=('thermald')
source=(${pkgname}::"git://github.com/intel/thermal_daemon"
        'modules-load-thermald.conf'
        'uninitialized_vars-fix.patch')
sha256sums=('SKIP'
            '0155e1eb459306d251a5a049ffc6c11e144fa8caa75901ac5fa20bd52e05d515'
            'fa71590c04cb0d1cd3db2d543f2402d887e7b12708f00a3af3005b1a000444df')

pkgver() {
	cd "${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
    cd ${pkgname}
    patch -p1 -i ${srcdir}/uninitialized_vars-fix.patch

}

build() {
  cd ${pkgname}
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sbindir=/usr/bin
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}"/modules-load-thermald.conf "${pkgdir}"/usr/lib/modules-load.d/thermald.conf
}
