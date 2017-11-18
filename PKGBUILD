# $Id$
# Maintainer: Christian Hesse <mail@eworm.de>
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)

pkgname=iproute2-selinux
pkgver=4.14.1
pkgrel=2
pkgdesc='IP Routing Utilities with SELinux support'
arch=('i686' 'x86_64')
license=('GPL2')
groups=('selinux')
url='https://git.kernel.org/pub/scm/linux/kernel/git/shemminger/iproute2.git'
depends=('glibc' 'iptables' 'libelf' 'libselinux')
optdepends=('linux-atm: ATM support')
provides=('iproute' "${pkgname/-selinux}=${pkgver}-${pkgrel}")
# Upstream commit b2fd7a0e6efa7b85a041b5cb9ea6fc1a6a798fd3 removed old documentation.
# Add conflict and replace to get rid of the package. TODO: Remove anytime soon.
conflicts=('iproute' 'iproute2-doc' "${pkgname/-selinux}" 'iproute2-selinux-doc')
replaces=('iproute2-selinux-doc')
backup=('etc/iproute2/ematch_map'
        'etc/iproute2/rt_dsfield'
        'etc/iproute2/rt_protos'
        'etc/iproute2/rt_realms'
        'etc/iproute2/rt_scopes'
        'etc/iproute2/rt_tables')
makedepends=('linux-atm')
options=('staticlibs')
validpgpkeys=('9F6FC345B05BE7E766B83C8F80A77F6095CDE47E') # Stephen Hemminger
source=("https://www.kernel.org/pub/linux/utils/net/${pkgname/-selinux}/${pkgname/-selinux}-${pkgver}.tar."{xz,sign}
        '0001-make-iproute2-fhs-compliant.patch')
sha256sums=('d43ac068afcc350a448f4581b6e292331ef7e4e7aa746e34981582d5fdb10067'
            'SKIP'
            'f60fefe4c17d3b768824bb50ae6416292bcebba06d73452e23f4147b46b827d3')

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

  make DESTDIR="${pkgdir}" SBINDIR="/usr/bin" install

  # libnetlink isn't installed, install it FS#19385
  install -Dm0644 include/libnetlink.h "${pkgdir}/usr/include/libnetlink.h"
  install -Dm0644 lib/libnetlink.a "${pkgdir}/usr/lib/libnetlink.a"
}

