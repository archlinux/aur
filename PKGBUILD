# Maintainer: Thomas Marchsteiner <tommy[0x2e]m86[0x40]gmail[0x2e]com>
pkgname=pfring-kmod-git
pkgver=20150708
_pkgname=PF_RING
pkgrel=1
pkgdesc="kernel module for packet capture at wirespeed"
url="http://www.ntop.org"
arch=('x86_64' 'i686')
license=('GPL')
depends=('numactl')
makedepends=('linux-headers' 'make' 'binutils' 'flex' 'bison' 'git')
conflicts=('pfring-kmod')
provides=('pfring-kmod')
source=("git+https://github.com/ntop/PF_RING.git")
md5sums=('SKIP')


pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}/kernel"
	./configure --prefix=/usr
	sed -i "s/INSTDIR\ \:=\ \$(DESTDIR)/INSTDIR := \$(DESTDIR)\/usr/g" Makefile
	make
}

package() {
	cd "${srcdir}/${_pkgname}/kernel"
	mkdir -p ${pkgdir}/usr/include/linux
	make DESTDIR="${pkgdir}" install
}
