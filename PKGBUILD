#  Maintainer: Sinnamon (George Aladin) <AngleSi at yahoo dot com>

pkgname=opendpi-netfilter-git
_pkgname=opendpi-netfilter
_pkgsrc=opendpi
pkgver=r7.c0fb9c1
pkgrel=1
pkgdesc="This package is a GPL implementation of an iptables and netfilter module for OpenDPI integration into the Linux kernel."
arch=('i686' 'x86_64')
license=('GPL2')
url="http://opendpi.org/"
depends=('iptables>=1.4.8' 'glibc' 'linux>=3.1')
makedepends=('linux-headers' 'linux-api-headers' 'git')
install=${_pkgname}.install
source=(${_pkgsrc}'::git+https://github.com/thomasbhatia/OpenDPI.git'
		${_pkgname}'::git+https://github.com/thomasbhatia/opendpi-netfilter.git'
		'protocols_make.patch')
md5sums=('SKIP' 'SKIP' 
		 '93d73ebf999433451fc6c2ca8b2858dd')

pkgver() {
	cd ${_pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


prepare() {
	patch -p1 -i "protocols_make.patch"
	cd ${srcdir}/${_pkgname}/src/
	if test -f "built-in.o";then  make clean;fi || return 1
}

build() {
	cd ${srcdir}/${_pkgname}
	OPENDPI_PATH=${srcdir}/${_pkgsrc} make -j1 || return 1

}

package() {
	mkdir -p $pkgdir/usr/lib/iptables/
	cd ${srcdir}/${_pkgname}
	cp ipt/libxt_opendpi.so ${pkgdir}/usr/lib/iptables/
	make -j1 modules_install INSTALL_MOD_PATH=${pkgdir}/usr || return 1
	mv ${pkgdir}/usr/lib/modules/$(uname -r)/extra $pkgdir/usr/lib/modules/$(uname -r)/$(readlink /usr/lib/modules/$(uname -r)/extramodules)
	rmdir ${pkgdir}/usr/lib/modules/$(uname -r)
	chmod a-x ${pkgdir}/usr/lib/iptables/libxt_opendpi.so
}
