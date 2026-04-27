# Maintainer: Matthias Gerstner <matthias.gerstner@nefkom.net>

pkgname='clues'
pkgver=v0.1.1
pkgrel=1
pkgdesc='next-generation Linux system call tracing framework'
arch=('i686' 'x86_64')
url='https://github.com/gerstner-hub/clues'
license=('GPL2')
_tag='ab840488e1488089e16722c70dcaf48bea762507' # v0.1.1
source=("git+${url}.git?signed#tag=$_tag")
sha256sums=('SKIP')
# note: this also depends on libcosmos, to be installed manually from AUR as well
depends=('glibc' 'gcc-libs' 'libcosmos')
makedepends=('scons' 'asciidoc')
# retrieve key for verification from PGP keyserver, or from github.com/gerstner-hub.gpg
validpgpkeys=('40C89F006FB8A328B83A37CC14AD6F6579097284')

pkgver() {
	cd "$pkgname"
	git describe
}

prepare() {
	cd "$pkgname"
	# we need the libcosmos submodule, which contains SCons build support scripts for nst
	git submodule init libcosmos
	git submodule update libcosmos
	# we need a newer TCLAP from the submodule
	git submodule init tclap
	git submodule update tclap
}

build() {
	# apply make job options for to SCons, if applicable
	echo "$MAKEFLAGS" | grep  -q '^-j[0-9]\+$' && export SCONSFLAGS="$MAKEFLAGS"

	cd "${srcdir}/${pkgname}"
	scons use-system-pkgs=1
}

check() {
	cd "${srcdir}/${pkgname}"
	scons run_tests
}

package() {
	cd "${srcdir}/${pkgname}"
	scons use-system-pkgs=1 install instroot="${pkgdir}/usr"
	local licensedir="${pkgdir}/usr/share/licenses/${pkgname}"
	mkdir -p "$licensedir"
	cp LICENSE "$licensedir"
	# no configuration at the moment
	#mv ${pkgdir}/usr/etc ${pkgdir}
}
