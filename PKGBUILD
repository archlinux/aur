# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Your Name <youremail@domain.com>
pkgname=tclmpi-git
pkgver=r159.7c08646
pkgrel=1
pkgdesc="OpenMPI bindings for Tcl"
arch=(any)
url="https://sites.google.com/site/akohlmey/software/tclmpi"
license=('custom')
groups=()
depends=('tcl' 'openmpi')
makedepends=('git' 'openmpi' 'tcl')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('tclmpi::git+https://github.com/akohlmey/tclmpi.git')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

## this isn't necessary any more??
#prepare() {
	## gotta patch up the Makefile to use the latest version of Tcl
	#cd "$srcdir/${pkgname%-git}"
	#sed -i -e 's/8\.5/8.6/g' Makefile
#}

build() {
	cd "$srcdir/${pkgname%-git}"
	make static
}

package() {
	cd "$srcdir/${pkgname%-git}"
	lib='/usr/lib/tclmpi'
	## The loadable package only works if OpenMPI is built not to use dlopen
	## Arch's openmpi package is not built this way, so we won't build it
	#mkdir -p "$pkgdir/$lib"
	#install pkgIndex.tcl "$pkgdir/$lib/"
	#install tclmpi.tcl "$pkgdir/$lib/"
	#install _tclmpi.so "$pkgdir/$lib/"

	mkdir -p "$pkgdir/usr/bin"
	install tclmpish "$pkgdir/usr/bin/"
	mkdir -p "$pkgdir/usr/share/tclmpi/"
	cp -r examples "$pkgdir/usr/share/tclmpi/"
	install LICENSE "$pkgdir/usr/share/tclmpi/"
	install README.md "$pkgdir/usr/share/tclmpi/" 

}
