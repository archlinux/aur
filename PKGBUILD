# $Id: PKGBUILD 273590 2016-08-11 09:35:58Z eworm $
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
# Contributor: George Amanakis <g_amanakis@yahoo.com>

pkgname=iproute2-cake
pkgver=4.9.0
pkgrel=3
pkgdesc="IP Routing Utilities"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.linuxfoundation.org/collaborate/workgroups/networking/iproute2"
#950 patch: https://raw.githubusercontent.com/lede-project/source/master/package/network/utils/iproute2/patches/950-add-cake-to-tc.patch
#modified according to github.com/dtaht/tc-adv repository
depends=('glibc' 'iptables')
makedepends=('linux-atm')
optdepends=('linux-atm: ATM support')
groups=('base')
provides=('iproute' 'iproute2')
conflicts=('iproute' 'iproute2')
replaces=('iproute')
options=('staticlibs' '!makeflags')
backup=('etc/iproute2/ematch_map' 'etc/iproute2/rt_dsfield' 'etc/iproute2/rt_protos' \
	'etc/iproute2/rt_realms' 'etc/iproute2/rt_scopes' 'etc/iproute2/rt_tables')
validpgpkeys=('9F6FC345B05BE7E766B83C8F80A77F6095CDE47E') # Stephen Hemminger
source=("http://www.kernel.org/pub/linux/utils/net/${pkgname/-cake}/${pkgname/-cake}-${pkgver}.tar."{xz,sign}
        '0001-make-iproute2-fhs-compliant.patch'
	'950b-add-cake-to-tc.patch'
	)
prepare() {
  cd "${srcdir}/${pkgname/-cake}-${pkgver}"

  # set correct fhs structure
  patch -Np1 -i "${srcdir}/950b-add-cake-to-tc.patch"
  patch -Np1 -i "${srcdir}/0001-make-iproute2-fhs-compliant.patch"

  # do not treat warnings as errors
  sed -i 's/-Werror//' Makefile

}

build() {
  cd "${srcdir}/${pkgname/-cake}-${pkgver}"

  ./configure
  make
}

package() {
  cd "${srcdir}/${pkgname/-cake}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # libnetlink isn't installed, install it FS#19385
  install -Dm644 include/libnetlink.h "${pkgdir}/usr/include/libnetlink.h"
  install -Dm644 lib/libnetlink.a "${pkgdir}/usr/lib/libnetlink.a"

  # move binaries
  cd "${pkgdir}"
  mv sbin usr/bin

}
sha1sums=('fc28f956a7a9695473312d0ed35dc24a7ef9d7f6'
          'SKIP'
          '1ed328854983b3f9df0a143aa7c77920916a13c1'
          '73c7e31c299fdb6d720fe0d0401b427f4cbd069c')
