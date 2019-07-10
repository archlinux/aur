# Maintainer: Tomas Pecka <peckato1 at fit dot cvut dot cz>

pkgname=('algorithms-library-git' 'algorithms-library-gui-git')
pkgbase='algorithms-library-git'
_pkgbase='automata-library'

pkgver=0.0.0.r515.gc4bc905a4
pkgrel=1

pkgdesc='Theoretical computer science datastructures and algorithms implementation. The library provides graphical and console interface similar to bash with many classical algorithms manipulating automata, grammars, regular expressions, trees and strings.'
arch=('x86_64' 'armv7' 'i686')
url='https://gitlab.fit.cvut.cz/algorithms-library-toolkit/'
license=('GPL')

makedepends=('python3' 'cmake' 'gcc>=7.3.1' 'make' 'tclap' 'libxml2' 'qt5-base>=5.7' 'graphviz' 'jsoncpp' 'git')
checkdepends=()

source=("$_pkgbase::git+https://gitlab.fit.cvut.cz/algorithms-library-toolkit/automata-library.git")
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "$_pkgbase"
	git describe --long --tags --match="v*" |  sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgbase"

	#patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"

	mkdir -p build
}

build() {
	cd "$_pkgbase/build"
	python ../CMake/generate.py -wm
	cmake .. \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

check() {
	cd "$_pkgbase/build"
	make test ARGS="--output-on-failure"
}

package_algorithms-library-git() {
	depends=('tclap' 'libxml2' 'readline')
	optdepends=('graphviz: Visualize data structures')
	provides=('algorithms-library')
	conflicts=('algorithms-library')

	cd "$_pkgbase/build"
	make DESTDIR="$pkgdir" install

	# remove gui parts
	mkdir -p gui/usr/lib gui/usr/bin gui/usr/include/algorithms-library

	# move binaries
	mv -f $pkgdir/usr/bin/agui2 gui/usr/bin

	# move libraries
	mv -f $pkgdir/usr/lib/libalib2gui* gui/usr/lib

	# move includes
	pushd ../alib2gui/src
	for file in $(find . -name "*.h" -o -name "*.hpp"); do
		mkdir -p $(dirname "../../build/gui/usr/include/algorithms-library/$file")
		mv $pkgdir/usr/include/algorithms-library/$file ../../build/gui/usr/include/algorithms-library/$file
	done
	popd
}

package_algorithms-library-gui-git() {
	depends=('libxml2' 'qt5-base>=5.7' 'graphviz' 'jsoncpp' "algorithms-library-git>=$pkgver" "algorithms-library-git<=$pkgver")
	provides=('algorithms-library-gui')
	conflicts=('algorithms-library-gui')

	cd "$_pkgbase/build"
	mv gui/* $pkgdir
}
