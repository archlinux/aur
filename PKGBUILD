# $Id$
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)

pkgname=iproute2-selinux
pkgver=4.5.0
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
        iproute2-fhs.patch)
sha1sums=('f6271aaf9b24b9c465622bea8a29a883034d8d49'
          'SKIP'
          '2dc6d8f1a2495a0d51eaa303dcc78ecc0c477935')

prepare() {
  cd "${srcdir}/${pkgname/-selinux}-${pkgver}"

  # set correct fhs structure
  patch -Np1 -i "${srcdir}/iproute2-fhs.patch"

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
