# Maintainer: Gustavo Ramos Rehermann <rehermann6046 at gmail.com>
# Contributor: Mikael Eriksson <mikael_eriksson at miffe.org>
# Contributor: Pol Marcet Sardà <polmarcetsarda at gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Curtis Smith <kman922002 at gmail.com>

pkgbase=odamex-git
pkgname=odamex-git
pkgver=10.4.0.r39.g0880dd097
pkgrel=1
pkgdesc='A free client/server multiplayer engine for the classic FPS Doom.'
arch=('i686' 'x86_64' 'aarch64')
url='http://odamex.net/'
license=('GPL')
depends=('sdl2_mixer' 'sdl2' 'portmidi' 'miniupnpc' 'curl' 'zlib' 'libpng')
makedepends=('git' 'cmake' 'deutex')
optdepends=('timidity++: Required for the SDL2 MIDI music backend'
            'doomseeker: Online Doom multiplayer server launcher')
source=(
	"odamex-git::git+https://github.com/odamex/odamex.git#branch=stable"
	#"git+https://github.com/curl/curl.git"
	#"git+https://github.com/madler/zlib.git"
	#"git+https://github.com/glennrp/libpng.git"
	"git+https://github.com/fltk/fltk"
	"git+https://github.com/protocolbuffers/protobuf.git"
	"git+https://github.com/miniupnp/miniupnp.git"
	"git+https://github.com/open-source-parsers/jsoncpp.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
provides=('odamex')
conflicts=('odamex')


pkgver() {
	cd "odamex-git"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

_submodlibs=(fltk protobuf miniupnp jsoncpp)

prepare() {
	cd odamex-git
	git submodule init
	for SUBMODLIB in "${_submodlibs[@]}"; do
    git config submodule.libraries/$SUBMODLIB.url "$srcdir/$SUBMODLIB"
	done
	git submodule--helper update
}

_configure() {
	cd "odamex-git"

	export CFLAGS="-DSDL20 $CFLAGS"
	export CXXFLAGS="-DSDL20 $CXXFLAGS"

	cmake -DCMAKE_BUILD_TYPE=None  \
		-D BUILD_LAUNCHER=True  \
		-DCMAKE_INSTALL_PREFIX=/usr  \
		.
}

build() {
	_configure
	make
}

package() {
	cd "odamex-git"

	make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
