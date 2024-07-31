# Maintainer: Matthias Gerstner <matthias.gerstner@nefkom.net>

pkgname='libxpp'
pkgver=v0.3.0
pkgrel=1
pkgdesc='A library providing an object orientented C++ API wrapper for parts of the X11 API'
arch=('i686' 'x86_64')
url='https://github.com/gerstner-hub/libxpp'
license=('MIT')
_tag='9c11c2b7e20e46d181dfa7c582c3bdfc72eb1dc6' # v0.3.0
source=("git+${url}.git?signed#tag=$_tag")
sha256sums=('SKIP')
# note: this also depends on libcosmos, to be installed manually from AUR as well
depends=('glibc' 'gcc-libs' 'libcosmos' 'libx11')
makedepends=('scons')
# retrieve key for verification from PGP keyserver, or from gibhub.com/gerstner-hub.gpg
validpgpkeys=('40C89F006FB8A328B83A37CC14AD6F6579097284')

pkgver() {
	cd "$pkgname"
	git describe
}

prepare() {
	cd "$pkgname"
	git submodule init
	git submodule update
}

build() {
	# apply make job options for to SCons, if applicable
	echo "$MAKEFLAGS" | grep  -q '^-j[0-9]\+$' && export SCONSFLAGS="$MAKEFLAGS"

	cd "${srcdir}/${pkgname}"
	scons use-system-pkgs=1
}

check() {
	if [ -z "$DISPLAY" ]; then
		echo "Skipping tests, because there is not X11 DISPLAY"
	else
		cd "${srcdir}/${pkgname}"
		scons use-system-pkgs=1 run_tests
	fi
}

package() {
	cd "${srcdir}/${pkgname}"
	scons use-system-pkgs=1 install instroot="${pkgdir}/usr"
	local licensedir="${pkgdir}/usr/share/licenses/${pkgname}"
	mkdir -p "$licensedir"
	cp LICENSE "$licensedir"
}
