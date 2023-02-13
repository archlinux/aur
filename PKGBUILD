pkgname=cpp-io2d-git
pkgver=P0267R8.r52.gcaa0ba0
pkgrel=1
pkgdesc="P0267 Reference Implementation - A Proposal to add 2d Rendering and Display to C++"
arch=('x86_64')
url="https://github.com/cpp-io2d/"
license=('boost')
depends=('boost-libs' 'cairo' 'libpng')
#optdepends=('')
makedepends=('git' 'cmake' 'boost' 'graphicsmagick' 'cairomm' 'libpng')
source=('git+https://github.com/cpp-io2d/P0267_RefImpl.git'
				'libpngPatch.diff'
				'sigsegv.diff')
sha512sums=('SKIP'
				'acb4bc932bc9249b53f31dcc0c07b3705ba4c685eab49b6d20bce4773a8aa8deda2bb51ed6232dbdeaedbcc1bdb2fc676fa407962d310431f4c216bb3d735d66'
				'SKIP')
_gitdir="P0267_RefImpl"

pkgver() {
	cd "$srcdir/$_gitdir"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_gitdir"
	git submodule update --init --recursive

	# Fix the path for libpng so it looks for libpng16 instead
	patch ./P0267_RefImpl/Tests/CMakeLists.txt ../libpngPatch.diff

	# Fix the compile error caused by the missing header
	patch ./P0267_RefImpl/Tests/main.cpp ../sigsegv.diff

	# Update submodule for external/svgpp
	#   Boost 1.71.0 and up broke broke the version of svgpp that
	#     this this is pinned to. Switching to 1.3.0 should fix
	# https://github.com/cpp-io2d/P0267_RefImpl/issues/136
	#  and its parent issue
	#  https://github.com/svgpp/svgpp/issues/79
	cd ./P0267_RefImpl/Samples/svg/external/svgpp
	git checkout v1.3.0
	cd "$srcdir/$_gitdir"

	mkdir build -p
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=usr
	cmake --build .
}

package() {
	cd "$srcdir/$_gitdir/build"
	cmake --install . --prefix="${pkgdir}/usr"
}

