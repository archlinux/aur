# Maintainer: AtticFinder65536 <atticfinder -AT- rocklabs -DOT- xyz>

pkgname=('teatimetools-git')
_gitname=('teatimetools')
pkgver=r128.c274e5e
pkgrel=2
pkgdesc="Library and CLI app for managing file formats found in certain games such as K-ON! Ho-kago Live!!"
url="https://github.com/Frain-Breeze/teatimetools"
license=('unknown')
# unique src names needed for submodules
source=(
	'git+https://github.com/Frain-Breeze/teatimetools.git'
	Frain-Breeze-std::'git+https://github.com/Frain-Breeze/stb.git'
	Frain-Breeze-libarchive::'git+https://github.com/Frain-Breeze/libarchive.git'
	Frain-Breeze-zlib::'git+https://github.com/Frain-Breeze/zlib.git'
	Frain-Breeze-luawrapper::'git+https://github.com/Frain-Breeze/luawrapper'
	Frain-Breeze-Lua-cmake::'git+https://github.com/Frain-Breeze/Lua-cmake.git'
)
b2sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)
arch=('x86_64')
# expat, zlib, xz needed for the static libarchive
# boost is needed for the static luawrapper which needs any.hpp
depends=('glibc' 'expat' 'zlib' 'xz')
makedepends=('git' 'cmake' 'boost')
provides=('teatimetools')
conflicts=('teatimetools')

pkgver(){
	cd "${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
	cd "${_gitname}"
	git submodule init
	git config submodule.stb.url "$srcdir/Frain-Breeze-stb"
	git config submodule.libarchive.url "$srcdir/Frain-Breeze-libarchive"
	git config submodule.zlib.url "$srcdir/Frain-Breeze-zlib"
	git config submodule.luawrapper.url "$srcdir/Frain-Breeze-luawrapper"
	git config submodule.Lua-cmake.url "$srcdir/Frain-Breeze-Lua-cmake"
	git submodule update

	cd "${srcdir}"
	cmake -B build -S "${_gitname}" -DCMAKE_INSTALL_PREFIX=/usr
}

build(){
	# Use-after-free error in libarchive, avoid it.
	# Doesn't work, idk an elegant way to fix it
	# One that doesn't involve erasing existing flags.
	# So just run the command twice.
	#export CFLAGS="-Wno-analyzer-use-after-free ${CFLAGS}"

	cmake --build build
}

package(){
	# Upstream does not make it install executable
	# Plus it installs stuff like zlib as system libs which is not wanted.
	#DESTDIR="$pkgdir" cmake --install build

	install -Dm755 build/teatimetools/teatimetools "${pkgdir}"/usr/bin/teatimetools
	install -Dm644 build/libteatime/liblibteatime.a "${pkgdir}"/usr/lib/liblibteatime.a
	install -Dm644 build/libteaio/libteaio.a "${pkgdir}"/usr/lib/libteaio.a
}
