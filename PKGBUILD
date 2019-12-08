# Maintainer: Christian Hesse <mail@eworm.de>
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=iproute2-selinux
pkgver=5.4.0
pkgrel=1
pkgdesc='IP Routing Utilities with SELinux support'
arch=('x86_64')
license=('GPL2')
groups=('selinux')
url='https://git.kernel.org/pub/scm/network/iproute2/iproute2.git'
depends=('glibc' 'iptables' 'libelf' 'libselinux')
optdepends=('linux-atm: ATM support')
provides=('iproute' "${pkgname/-selinux}=${pkgver}-${pkgrel}")
conflicts=("${pkgname/-selinux}")
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
sha256sums=('fe97aa60a0d4c5ac830be18937e18dc3400ca713a33a89ad896ff1e3d46086ae'
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

