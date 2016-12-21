# Contributor: gamanakis

pkgname=iproute2-cake
pkgver=4.9.0
pkgrel=2
pkgdesc="IP Routing Utilities with tc-support for the CAKE scheduler"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.linuxfoundation.org/collaborate/workgroups/networking/iproute2"
#950 patch: https://raw.githubusercontent.com/lede-project/source/master/package/network/utils/iproute2/patches/950-add-cake-to-tc.patch
#tc-cake.8 man page: https://github.com/dtaht/tc-adv/blob/master/man/man8/tc-cake.8
depends=('glibc' 'iptables' 'sch_cake')
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
	'950-add-cake-to-tc.patch'
	'tc-cake.8.gz')

prepare() {
  cd "${srcdir}/${pkgname/-cake}-${pkgver}"

  # set correct fhs structure
  patch -Np1 -i "${srcdir}/950-add-cake-to-tc.patch"
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

  cd "${srcdir}"
  cp tc-cake.8.gz "${pkgdir}/usr/share/man/man8"

}

sha1sums=('fc28f956a7a9695473312d0ed35dc24a7ef9d7f6'
          'SKIP'
          '1ed328854983b3f9df0a143aa7c77920916a13c1'
          'f0693506ece8bcaa5377adfe490c88e066436ff0'
          '809c815b4d86c68ed90f8d5c875a7a49618e3051')
