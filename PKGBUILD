# Maintainer: Gustavo Ramos Rehermann <rehermann6046 at gmail.com>
# Contributor: Mikael Eriksson <mikael_eriksson at miffe.org>
# Contributor: Pol Marcet Sardà <polmarcetsarda at gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Curtis Smith <kman922002 at gmail.com>

pkgbase=odamex-git
pkgname=odamex-git
pkgver=10.2.0.r2.g6c2940915
pkgrel=1
pkgdesc='A free client/server multiplayer engine for the classic FPS Doom.'
arch=('i686' 'x86_64' 'aarch64')
url='http://odamex.net/'
license=('GPL')
depends=('sdl2_mixer' 'portmidi' 'wxgtk2' 'miniupnpc')
makedepends=('git' 'cmake' 'deutex' 'ninja')
optdepends=('timidity++: Required for music')
source=(
	"odamex-git::git+https://github.com/odamex/odamex.git#branch=stable"
	"git+https://github.com/curl/curl.git"
	"git+https://github.com/madler/zlib.git"
	"git+https://github.com/glennrp/libpng.git"
	"git+https://github.com/fltk/fltk"
	"git+https://github.com/protocolbuffers/protobuf.git"
	"git+https://github.com/miniupnp/miniupnp.git"
	"git+https://github.com/open-source-parsers/jsoncpp.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
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

_submodlibs=(curl zlib libpng fltk protobuf miniupnp jsoncpp)

prepare() {
	cd odamex-git

	git submodule init
	for SUBMODLIB in "${_submodlibs[@]}"; do
		git config submodule.libraries/$SUBMODLIB.url "$srcdir/$SUBMODLIB"
	done
	git submodule update
}

_configure() {
	cd "odamex-git"

	cmake -DCMAKE_BUILD_TYPE=Release  \
		-DCMAKE_INSTALL_PREFIX=/usr  \
		-GNinja  \
		.
}

build() {
	_configure
	ninja $NINJAFLAGS
}

package() {
	cd "odamex-git"

	ninja DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
