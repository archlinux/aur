# Maintainer: Simon Bachmann simonbachmann@bluewin.ch
pkgname=critcl-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=3.1.16rc0.r10.21a4e10
pkgrel=2
pkgdesc="Critcl lets you easily embed C code in Tcl."
arch=('any')
url="http://andreas-kupries.github.io/critcl/"
license=('BSD')
groups=()
depends=('tcl' 'tcllib' 'gcc')
makedepends=('git' 'tcl>=8.5')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('critcl::git+http://github.com/andreas-kupries/critcl#branch=master' 'destdir.patch')
noextract=()
md5sums=('SKIP'
         'b7d96a2d75916544babf9b7c160eeeff')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# Git, tags available
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch -p1 -i "$srcdir/destdir.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	# Only thing to build is the doc
	tclsh ./build.tcl doc > /dev/null
}

check() {
	cd "$srcdir/${pkgname%-git}"
	tclsh ./build.tcl test > /dev/null
}

package() {
	cd "$srcdir/${pkgname%-git}"
	tclsh ./build.tcl install $pkgdir/$(echo "puts [info library]" | tclsh) > /dev/null
	
	# install the doc manually
	install -m 755 -d $pkgdir/usr/share/man/mann
	install -m 444 -t $pkgdir/usr/share/man/mann ./embedded/man/files/critcl_*.n
}

