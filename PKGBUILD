# Maintainer: Tony Lambiris <tony@criticalstack.com>
pkgname=pfring-kmod-dev-git
pkgver=6.6.0.r34.g6a0984a
_pkgname=PF_RING
pkgrel=1
pkgdesc="High-speed packet processing framework (dev branch)"
url="http://www.ntop.org"
arch=('x86_64' 'i686')
license=('GPL')
depends=('numactl')
makedepends=('linux-headers' 'make' 'binutils' 'flex' 'bison' 'git')
conflicts=('pfring-kmod')
provides=('pfring-kmod')
source=("git+https://github.com/ntop/PF_RING.git#branch=6.6.0-stable")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags| sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
