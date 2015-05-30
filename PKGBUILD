# $Id$
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)

pkgname=iproute2-selinux
pkgver=4.0.0
pkgrel=2
pkgdesc="IP Routing Utilities with SELinux support"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.linuxfoundation.org/collaborate/workgroups/networking/iproute2"
depends=('glibc' 'iptables' 'libselinux')
makedepends=('linux-atm')
optdepends=('linux-atm: ATM support')
groups=('base')
provides=('iproute' "${pkgname/-selinux}=${pkgver}-${pkgrel}")
conflicts=('iproute' "${pkgname/-selinux}")
replaces=('iproute')
options=('staticlibs' '!makeflags')
backup=('etc/iproute2/ematch_map' 'etc/iproute2/rt_dsfield' 'etc/iproute2/rt_protos' \
	'etc/iproute2/rt_realms' 'etc/iproute2/rt_scopes' 'etc/iproute2/rt_tables')
validpgpkeys=('9F6FC345B05BE7E766B83C8F80A77F6095CDE47E') # Stephen Hemminger
source=("http://www.kernel.org/pub/linux/utils/net/${pkgname/-selinux}/${pkgname/-selinux}-$pkgver.tar."{xz,sign}
        iproute2-fhs.patch
        unwanted-link-help.patch
	tc.patch)
sha1sums=('d24385ae619966d1bd71e146322d6035d60aaa1a'
          'SKIP'
          '35b8cf2dc94b73eccad427235c07596146cd6f6c'
          '3b1335f4025f657f388fbf4e5a740871e3129c2a'
          '81124e20802ff06bad616debab827b03a3c75679')

prepare() {
  cd "${srcdir}/${pkgname/-selinux}-${pkgver}"

  # set correct fhs structure
  patch -Np1 -i "${srcdir}/iproute2-fhs.patch"

  # allow operations on links called "h", "he", "hel", "help"
  patch -Np1 -i "${srcdir}/unwanted-link-help.patch"

  # upstream patch for FS#45031: tc qdisc show broken
  patch -Np1 -i "${srcdir}/tc.patch"

  # do not treat warnings as errors
  sed -i 's/-Werror//' Makefile

}

build() {
  cd "${srcdir}/${pkgname/-selinux}-${pkgver}"

  ./configure --with-selinux
  make
}

package() {
  cd "${srcdir}/${pkgname/-selinux}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # libnetlink isn't installed, install it FS#19385
  install -Dm644 include/libnetlink.h "${pkgdir}/usr/include/libnetlink.h"
  install -Dm644 lib/libnetlink.a "${pkgdir}/usr/lib/libnetlink.a"

  # usrmove
  cd "${pkgdir}"
  mv usr/sbin usr/bin
}
