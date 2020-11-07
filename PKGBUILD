# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=libmtk-git
pkgver=0.1.0.r0.g365e6ee
pkgrel=1
pkgdesc="A library to allow shared object modules to be loaded dynamically into a running PCB plug-in"
arch=('any')
url="https://gitlab.com/soft.at.home/pcb/libmtk.git"
license=('MIT')

depends=(
	'libsahtrace'
	'libpcb'
)
makedepends=(
	'sah_components_config'
	'm4'
	'gcc'
	'make'
)
provides=(
	'libmtk'
	'libmtk-git'
)
conflicts=(
	'libmtk'
	'libmtk-git'
)

gitbranch="master"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/pcb/libmtk.git#branch=${gitbranch}" "components.config")
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	sah_components_config
	! mkdir include
	cp -f components.h include/components.h 
}

build() {
	# STAGINGDIR
	export STAGINGDIR=$(pwd)
	cd "${pkgname}"
	make -C pkgconfig clean
	make -C src clean
	make
}

package() {
	cd "${pkgname}"
	make D="${pkgdir}/" install
	mv ${pkgdir}/lib/* ${pkgdir}/usr/lib/
	rm -Rf ${pkgdir}/lib/
}
