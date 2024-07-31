# Maintainer: Matthias Gerstner <matthias.gerstner@nefkom.net>

pkgname='nst'
pkgver=v1.0.2
pkgrel=1
pkgdesc='An X11 terminal emulator with focus on security, simplicity, productivity and customizability intended for power users'
arch=('i686' 'x86_64')
url='https://github.com/gerstner-hub/nst'
license=('MIT')
_tag='a75fefd65a61c437b6ced9d5753d0524f8e8fb2d' # v1.0.2
source=("git+${url}.git?signed#tag=$_tag")
sha256sums=('SKIP')
# note: this also depends on libcosmos, to be installed manually from AUR as well
depends=('glibc' 'gcc-libs' 'libcosmos' 'libxpp' 'libxft' 'libx11' 'fontconfig')
makedepends=('scons' 'asciidoc')
# retrieve key for verification from PGP keyserver, or from gibhub.com/gerstner-hub.gpg
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

package() {
	cd "${srcdir}/${pkgname}"
	scons use-system-pkgs=1 install instroot="${pkgdir}/usr"
	local licensedir="${pkgdir}/usr/share/licenses/${pkgname}"
	mkdir -p "$licensedir"
	cp LICENSE "$licensedir"
	mv ${pkgdir}/usr/etc ${pkgdir}
}
