# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=pcb-cli-git
pkgver=0.1.0.r0.g8822f59
pkgrel=2
pkgdesc="This application provides a CLI (Command Line Interface) towards the PCB ecosystem it is connected to"
arch=('any')
url="https://gitlab.com/soft.at.home/pcb/pcb-cli.git"
license=('MIT')

depends=(
	'libsahtrace'
	'libpcb'
	'libusermngt'
)
makedepends=(
	'sah_components_config'
	'm4'
	'gcc'
	'make'
)
provides=(
	'pcb-cli'
	'pcb-cli-git'
)
conflicts=(
	'pcb-cli'
	'pcb-cli-git'
)

gitbranch="master"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/pcb/pcb-cli.git#branch=${gitbranch}" "components.config")
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
	install -d ${pkgdir}/usr/bin
	mv ${pkgdir}/bin/* ${pkgdir}/usr/bin/
	rm -Rf ${pkgdir}/bin/
}
