# $Id$
# Maintainer: Christian Hesse <mail@eworm.de>
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
# Maintainer: George Amanakis <g_amanakis@yahoo.com>

pkgname=iproute2-cake
_srcname=tc-adv
pkgver=r4214.0407be50
pkgrel=1
pkgver() {
  	cd "${srcdir}/${_srcname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgdesc='IP Routing Utilities'
arch=('x86_64')
license=('GPL2')
url='https://www.github.com/dtaht/tc-adv'
depends=('glibc' 'iptables' 'libelf')
optdepends=('linux-atm: ATM support')
groups=('base')
provides=('iproute' 'iproute2')
#tc-cake.8 man page: https://github.com/dtaht/tc-adv/blob/master/man/man8/tc-cake.8
# Upstream commit b2fd7a0e6efa7b85a041b5cb9ea6fc1a6a798fd3 removed old documentation.
# Add conflict and replace to get rid of the package. TODO: Remove anytime soon.
conflicts=('iproute' 'iproute2-doc')
replaces=('iproute' 'iproute2-doc')
backup=('etc/iproute2/ematch_map'
        'etc/iproute2/rt_dsfield'
        'etc/iproute2/rt_protos'
        'etc/iproute2/rt_realms'
        'etc/iproute2/rt_scopes'
        'etc/iproute2/rt_tables')
makedepends=('linux-atm')
options=('staticlibs')
validpgpkeys=('9F6FC345B05BE7E766B83C8F80A77F6095CDE47E') # Stephen Hemminger
source=('git+https://www.github.com/dtaht/tc-adv'
	'0001-make-iproute2-fhs-compliant.patch')

prepare() {
  cd "${srcdir}/${_srcname}"

  # set correct fhs structure
  patch -Np1 -i "${srcdir}/0001-make-iproute2-fhs-compliant.patch"

  # do not treat warnings as errors
  sed -i 's/-Werror//' Makefile

}

build() {
  cd "${srcdir}/${_srcname}"

  ./configure
  make
}

package() {
  cd "${srcdir}/${_srcname}"

  make DESTDIR="${pkgdir}" SBINDIR="/usr/bin" install

  # libnetlink isn't installed, install it FS#19385
  install -Dm0644 include/libnetlink.h "${pkgdir}/usr/include/libnetlink.h"
  install -Dm0644 lib/libnetlink.a "${pkgdir}/usr/lib/libnetlink.a"
}

md5sums=('SKIP'
         '5345bd18b521fb2f305acb2ab1203269')
