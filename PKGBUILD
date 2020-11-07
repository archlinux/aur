# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=libpcb-git
pkgver=0.1.2.r0.gaebfbc1
pkgrel=5
pkgdesc="Library providing common functionality to the PCB ecosystem"
arch=('any')
url="https://gitlab.com/soft.at.home/pcb/libpcb.git"
license=('MIT')

depends=(
	'libsahtrace'
	'openssl'
	'libusermngt'
)
makedepends=(
	'sah_components_config'
	'm4'
	'gcc'
	'make'
)
provides=(
	'libpcb'
	'libpcb-git'
)
conflicts=(
	'libpcb'
	'libpcb-git'
)

gitbranch="master"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/pcb/libpcb.git#branch=${gitbranch}" "components.config")
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
	export CONFIGDIR=$STAGINGDIR
	cd "${pkgname}"
	make clean
	make
}

package() {
	cd "${pkgname}"
	make D="${pkgdir}/" install
	mv ${pkgdir}/lib/* ${pkgdir}/usr/lib/
	rm -Rf ${pkgdir}/lib/
}
