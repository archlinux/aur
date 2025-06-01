# Maintainer: bemxio <bemxiov at protonmail dot com>
# Contributor: Felix Yan <felixonmars at archlinux dot org>
# Contributor: pingplug <aur at pingplug dot me>

pkgname=mingw-w64-winpthreads-git
pkgdesc="MinGW-w64 winpthreads library (git version)"

_targets="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver=12.0.0.r759.gc3b5e71
pkgrel=1

arch=(any)

url="http://mingw-w64.sourceforge.net"
license=("MIT")

makedepends=(mingw-w64-gcc mingw-w64-binutils mingw-w64-crt)

provides=("mingw-w64-winpthreads=${pkgver}")
conflicts=(mingw-w64-winpthreads)

source=("git+https://git.code.sf.net/p/mingw-w64/mingw-w64")
md5sums=("SKIP")

options=("staticlibs" "!strip" "!buildflags")

pkgver() {
	# move to the source directory
	cd mingw-w64

	# use the most recent annotated tag reachable from the last commit
	git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	for _target in ${_targets}; do
		# make a build directory and move into it
		mkdir -p "winpthreads-build-${_target}" && cd "winpthreads-build-${_target}"
		
		# configure the build
		"${srcdir}/mingw-w64/mingw-w64-libraries/winpthreads/configure" \
			--prefix="/usr/${_target}" \
			--host="${_target}" \
			--enable-static --enable-shared
		
		# build the library
		make
	done
}

package() {
	for _target in ${_targets}; do
		# move to the build directory
		cd "winpthreads-build-${_target}"

		# install the library
		make DESTDIR="${pkgdir}" install

		# strip unneeded symbols from the DLLs
		"${_target}-strip" --strip-unneeded "${pkgdir}/usr/${_target}/bin"/*.dll
	done
}
