# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=libsahtrace-git
pkgver=v1.0.0.r0.gedbe4ae
pkgrel=1
pkgdesc="Small and flexible library to enable tracing and logging"
arch=('any')
url="https://gitlab.com/soft.at.home/logging/libsahtrace.git"
license=('MIT')

depends=(
)
makedepends=(
	'sah_components_config'
	'm4'
	'gcc'
	'make'
)
provides=(
	'libsahtrace'
	'libsahtrace-git'
)
conflicts=(
	'libsahtrace'
	'libsahtrace-git'
)

gitbranch="main"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/logging/libsahtrace.git#branch=${gitbranch}" "components.config")
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
	# Disable some warnings
	export CFLAGS+=" -Wstringop-overflow=0 -Wno-stringop-truncation"
	cd "${pkgname}"
	make clean
	make
}

package() {
	cd "${pkgname}"
	make D="${pkgdir}/" install
	mkdir ${pkgdir}/usr/lib/
	mv ${pkgdir}/lib/libsahtrace* ${pkgdir}/usr/lib/
	rm -Rf ${pkgdir}/lib/
}
