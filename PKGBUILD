# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=mod_sahtrace-git
pkgver=v0.0.9.r0.g0656055
pkgrel=1
pkgdesc="Ambiorix module for sahtrace"
arch=('any')
url="https://gitlab.com/soft.at.home/ambiorix/modules/mod-sahtrace.git"
license=('MIT')

depends=(
	'lib_amxc'
	'lib_amxp'
	'lib_amxo'
	'libsahtrace'
)
makedepends=(
)
provides=(
	'mod_sahtrace'
	'mod_sahtrace-git'
)
conflicts=(
	'mod_sahtrace'
	'mod_sahtrace-git'
)

gitbranch="main"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/ambiorix/modules/mod-sahtrace.git#branch=${gitbranch}" "components.config")
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
	cd "${pkgname}"
	export CFLAGS="${CFLAGS} -I$(realpath ../include)"
	make
}

package() {
	cd "${pkgname}"
	make DEST="${pkgdir}/" LIBDIR="/usr/lib" install
}
