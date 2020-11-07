# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=pcb-app-git
pkgver=0.1.0.r0.g1811676
pkgrel=1
pkgdesc="This application is the main binary used for creating PCB plug-ins"
arch=('any')
url="https://gitlab.com/soft.at.home/pcb/pcb-app.git"
license=('MIT')

depends=(
	'libsahtrace'
	'libpcb'
	'libmtk'
	'openssl'
)
makedepends=(
	'sah_components_config'
	'm4'
	'gcc'
	'make'
)
provides=(
	'pcb-app'
	'pcb-app-git'
)
conflicts=(
	'pcb-app'
	'pcb-app-git'
)

gitbranch="master"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/pcb/pcb-app.git#branch=${gitbranch}" "components.config")
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
	export INSTALL=install

	cd "${pkgname}"
	make D="${pkgdir}/" install
	install -d ${pkgdir}/usr/bin
	mv ${pkgdir}/bin/* ${pkgdir}/usr/bin/
	rm -Rf ${pkgdir}/bin/
}
