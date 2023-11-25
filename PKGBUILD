# Maintainer: Nadia Holmquist Pedersen <nadia@nhp.sh>

_pkgbase=nanoboyadvance
pkgbase="${_pkgbase}-git"
pkgname="${_pkgbase}-git"
pkgdesc="Accuracy-focused Game Boy Advance emulator."
pkgver=1.7.1.r50.gf94692a4
pkgrel=1
arch=(x86_64)
url="https://github.com/nba-emu/NanoBoyAdvance"
license=(GPL3)
makedepends=(cmake make git gcc imagemagick)
depends=(qt5-base glew sdl2)

source=(
	"git+https://github.com/nba-emu/NanoBoyAdvance.git" 
	"git+https://github.com/fmtlib/fmt.git"
	"git+https://github.com/ToruNiina/toml11.git"
	"git+https://github.com/selmf/unarr.git"
)

sha256sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

pkgver() {
	cd NanoBoyAdvance
	git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd NanoBoyAdvance
	git submodule init
	git submodule set-url external/fmtlib "${srcdir}/fmt"
	git submodule set-url external/toml11 "${srcdir}/toml11"
	git submodule set-url external/unarr "${srcdir}/unarr"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir/NanoBoyAdvance"
	cmake -B build \
		-DCMAKE_BUILD_TYPE=None \
		-DPORTABLE_MODE=OFF \
		-DCMAKE_INSTALL_PREFIX=/usr

	cmake --build build
}

package() {
	cd "$srcdir/NanoBoyAdvance"

	DESTDIR="$pkgdir" cmake -P build/bin/qt/cmake_install.cmake
}
