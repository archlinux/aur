# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=libusermngt-git
pkgver=0.1.0.r0.gc405f27
pkgrel=1
pkgdesc="The module libusermngt allows fast access to the user datamodel by means of a temporary file"
arch=('any')
url="https://gitlab.com/soft.at.home/pcb/libusermngt.git"
license=('MIT')

depends=(
	'libsahtrace'
	'openssl'
)
makedepends=(
	'sah_components_config'
	'm4'
	'gcc'
	'make'
)
provides=(
	'libusermngt'
	'libusermngt-git'
)
conflicts=(
	'libusermngt'
	'libusermngt-git'
)

gitbranch="master"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/pcb/libusermngt.git#branch=${gitbranch}" "components.config")
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
	mv ${pkgdir}/lib/* ${pkgdir}/usr/lib/
	rm -Rf ${pkgdir}/lib/
}
