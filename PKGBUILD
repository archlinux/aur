# Maintainer: Matthias Gerstner <matthias.gerstner@nefkom.net>
#
# this is a variant of nst that statically links against libcosmos and libxpp
# for simplicity reasons. If you already have libcosmos and libxpp installed
# then you should prefer the regular nst package.

pkgname='nst-static'
pkgver=v1.0.2
pkgrel=1
pkgdesc='An X11 terminal emulator with focus on security, simplicity, productivity and customizability intended for power users'
arch=('i686' 'x86_64')
url='https://github.com/gerstner-hub/nst'
license=('MIT')
_tag='303d9260735da6ca9ffeb344adb9d405a28c22f6' # v1.0.2
source=("git+${url}.git?signed#tag=$_tag")
sha256sums=('SKIP')
# note: this also depends on libcosmos, to be installed manually from AUR as well
depends=('glibc' 'gcc-libs' 'libxft' 'libx11' 'fontconfig')
makedepends=('scons' 'asciidoc')
# retrieve key for verification from PGP keyserver, or from gibhub.com/gerstner-hub.gpg
validpgpkeys=('40C89F006FB8A328B83A37CC14AD6F6579097284')
_pkgbase='nst'

pkgver() {
	cd "$_pkgbase"
	git describe
}

prepare() {
	cd "$_pkgbase"
	git submodule init
	git submodule update
}

build() {
	# apply make job options for to SCons, if applicable
	echo "$MAKEFLAGS" | grep  -q '^-j[0-9]\+$' && export SCONSFLAGS="$MAKEFLAGS"

	cd "${srcdir}/${_pkgbase}"
	scons libtype=static
}

package() {
	cd "${srcdir}/${_pkgbase}"
	scons libtype=static install instroot="${pkgdir}/usr"
	local licensedir="${pkgdir}/usr/share/licenses/${_pkgbase}"
	mkdir -p "$licensedir"
	cp LICENSE "$licensedir"
	mv ${pkgdir}/usr/etc ${pkgdir}
}
