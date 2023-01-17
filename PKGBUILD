# Maintainer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: ceri
# Contributor: Imperator Storm <30777770+ImperatorStorm@users.noreply.github.com>

_pkgbase='citra'
pkgbase="$_pkgbase-git"
pkgname=("$_pkgbase-git" "$_pkgbase-qt-git")
pkgver=r9391.9c6035f25
pkgrel=1
pkgdesc="An experimental open-source Nintendo 3DS emulator/debugger"
arch=('i686' 'x86_64')
url="https://github.com/citra-emu/citra/"
license=('GPL2')
depends=('ffmpeg')
makedepends=('git' 'cmake' 'sdl2' 'qt5-base' 'shared-mime-info' 'desktop-file-utils' 'qt5-multimedia')
source=("$_pkgbase::git+https://github.com/citra-emu/citra"
        "boost::git+https://github.com/citra-emu/ext-boost/"
        "catch::git+https://github.com/catchorg/Catch2"
        "cpp-jwt::git+https://github.com/arun11299/cpp-jwt"
        "cubeb::git+https://github.com/mozilla/cubeb"
        "discord-rpc::git+https://github.com/discord/discord-rpc"
        "dynarmic::git+https://github.com/merryhime/dynarmic"
        "enet::git+https://github.com/lsalzman/enet"
        "fmt::git+https://github.com/fmtlib/fmt"
        "libressl::git+https://github.com/citra-emu/ext-libressl-portable"
        "nihistro::git+https://github.com/neobrain/nihstro"
        "soundtouch::git+https://github.com/citra-emu/ext-soundtouch"
        "teakra::git+https://github.com/wwylele/teakra"
        "xbyak::git+https://github.com/herumi/xbyak"
        "zstd::git+https://github.com/facebook/zstd"
        "inih::git+https://github.com/benhoyt/inih"
        "libusb::git+https://github.com/libusb/libusb"
        "cryptopp::git+https://github.com/weidai11/cryptopp"
        "lodepng::git+https://github.com/lvandeve/lodepng"
        "sanitizers-cmake::git+https://github.com/arsenm/sanitizers-cmake"
        "googletest::git+https://github.com/google/googletest")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

# Clang generates weird object files when LTO is enabled, breaking static libraries (.a).
# Force-disable LTO if we are using clang.
if [ "$CXX" = "clang++" ]; then
	options=('!lto')
fi

pkgver() {
	cd "$srcdir/$_pkgbase"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgbase"

	if [[ -d build ]]; then
		rm -rf build
	fi
	mkdir build

	git submodule init
	for external in boost catch cpp-jwt cubeb discord-rpc dynarmic enet fmt libressl nihistro soundtouch teakra xbyak zstd inih libusb cryptopp lodepng; do
		git config submodule.$external.url "$srcdir/$external"
	done
	git -c protocol.file.allow=always submodule update

	# agh, submodule has submodules
	cd externals/cubeb
	git submodule init
	git config submodule.cmake/sanitizers-cmake.url "$srcdir/sanitizers-cmake"
	git config submodule.googletest.url "$srcdir/googletest"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir/$_pkgbase/build"

	# Bump the expression nesting limit for clang
	if [ "$CXX" = "clang++" ]; then
		CXXFLAGS+=" -fbracket-depth=649"
	fi

	cmake .. \
	  -DCMAKE_INSTALL_PREFIX=/usr \
	  -DCMAKE_BUILD_TYPE=Release \
	  -DENABLE_FFMPEG_AUDIO_DECODER=ON \
	  -DUSE_SYSTEM_CURL=ON
	make
}

check() {
	cd "$srcdir/$_pkgbase/build"
	make test
}

package_citra-git() {
	depends=('sdl2' 'libpng')

	install -Dm755 "$srcdir/$_pkgbase/build/bin/Release/citra" "$pkgdir/usr/bin/citra"
}

package_citra-qt-git() {
	depends=('qt5-base' 'qt5-multimedia' 'sdl2' 'shared-mime-info' 'desktop-file-utils')
	optdepends=('libxkbcommon-x11: for X11 support'
	            'qt5-wayland: for Wayland support')

	cd "$srcdir/$_pkgbase/build"
	make DESTDIR="$pkgdir/" install
	rm "$pkgdir/usr/bin/citra"

	# Remove global installations of dependencies
	rm -rf "${pkgdir}/usr/include" "${pkgdir}/usr/lib"
}
