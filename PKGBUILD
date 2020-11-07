# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=pcb-bus-git
pkgver=0.1.0.r0.g2c34b64
pkgrel=1
pkgdesc="This application acts as an PCB system bus. It connects all PCB plug-ins connected to the bus and forwards requests between them"
arch=('any')
url="https://gitlab.com/soft.at.home/pcb/pcb-bus.git"
license=('MIT')

depends=(
	'libsahtrace'
	'openssl'
	'libpcb'
	'libusermngt'
	'pcb-ser-odl'
)
makedepends=(
	'sah_components_config'
	'm4'
	'gcc'
	'make'
)
provides=(
	'pcb-bus'
	'pcb-bus-git'
)
conflicts=(
	'pcb-bus'
	'pcb-bus-git'
)

gitbranch="master"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/pcb/pcb-bus.git#branch=${gitbranch}" "components.config")
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
	make clean
	make
}

package() {
	cd "${pkgname}"
	make D="${pkgdir}/" install
	mv ${pkgdir}/bin/* ${pkgdir}/usr/bin/
	rm -Rf ${pkgdir}/bin/
}
