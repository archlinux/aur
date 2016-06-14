# Maintainer: Jeffrey Lin <anaveragehuman.0 at gmail dot com>
# Contributor: Ng Oon-Ee <ngoonee.talk@gmail.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Guillaume ALAUX <guillaume at alaux dot net>

pkgname=hibernate-script
pkgver=2.0
pkgrel=9
pkgdesc="Set of scripts for managing tux on ice, hibernation and suspend to RAM"
arch=('any')
url="http://www.tuxonice.net"
license=('GPL')
depends=('sh')
optdepends=('pm-utils: hibernate-script sets itself as default when used with pm-utils')
options=(!strip)
install="hibernate-script.install"
backup=('etc/hibernate/hibernate.conf' 'etc/hibernate/tuxonice.conf' \
        'etc/hibernate/disk.conf' 'etc/hibernate/ram.conf' \
        'etc/hibernate/common.conf' 'etc/hibernate/blacklisted-modules' \
        'etc/hibernate/ususpend-both.conf' 'etc/hibernate/sysfs-ram.conf' \
        'etc/hibernate/ususpend-ram.conf' 'etc/hibernate/sysfs-disk.conf' \
        'etc/hibernate/ususpend-disk.conf')
source=(http://tuxonice.nigelcunningham.com.au/downloads/all/${pkgname}-${pkgver}.tar.gz
        hibernate-script-${pkgver}-arch.patch
        hibernate.rc
        pmutils_hook
        pmutils_module)
md5sums=('5c21770afbae503450e3c4a5502bf29d'
         '3cc1d65ba85495e8b32be1965c2ad6a9'
         '0c033f583d4fa2e2d249b788fd92a0ce'
         '346bb1c63d5535e0e2dd55945e11c308'
         '6802a2ce79af5e5744b01fd0bdb781bf')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  # Fix scriptlets to work properly with Archlinux
  patch -Np1 -i ${srcdir}/${pkgname}-${pkgver}-arch.patch
  sed -i 's|#!\/bin\/sh|#!\/bin\/bash|' "${srcdir}/hibernate-script-2.0/hibernate.sh"
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  export BASE_DIR=${pkgdir}
  export PREFIX=/usr
  export MAN_DIR=$BASE_DIR$PREFIX/share/man
  export SCRIPT_DEST=$BASE_DIR$PREFIX/bin/hibernate
  install -dm755 ${pkgdir}/etc/{rc,logrotate}.d
  install -dm755 ${pkgdir}/etc/pm/config.d
  install -dm755 ${pkgdir}/usr/lib/pm-utils/module.d
  ./install.sh || return 1
  install -m 755 ${srcdir}/hibernate.rc ${pkgdir}/etc/rc.d/hibernate-cleanup
  install -m 755 ${srcdir}/pmutils_hook ${pkgdir}/etc/pm/config.d/use_hibernate_script
  install -m 755 ${srcdir}/pmutils_module ${pkgdir}/usr/lib/pm-utils/module.d/hibernate
  # Allow for behaviour as in man-page (calling by hibernate-* uses
  # /etc/hibernate/*.conf file.
  ln -s /usr/bin/hibernate ${pkgdir}/usr/bin/hibernate-ram
  ln -s /usr/bin/hibernate ${pkgdir}/usr/bin/hibernate-disk
}
