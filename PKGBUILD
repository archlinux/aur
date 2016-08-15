# $Id$
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)

pkgname=iproute2-selinux
pkgver=4.7.0
pkgrel=1
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
        '0001-make-iproute2-fhs-compliant.patch')
sha1sums=('eafdefb9ebe7c840fa4ea8ea111554e3650a3c5a'
          'SKIP'
          '1ed328854983b3f9df0a143aa7c77920916a13c1')

prepare() {
  cd "${srcdir}/${pkgname/-selinux}-${pkgver}"

  # set correct fhs structure
  patch -Np1 -i "${srcdir}/0001-make-iproute2-fhs-compliant.patch"

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

  # move binaries
  cd "${pkgdir}"
  mv sbin usr/bin

}
