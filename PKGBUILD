# Maintainer: Pierre Choffet <peuc@wanadoo.fr>

pkgname=return-to-the-roots-git
pkgver=r5113.85a6b9941
pkgrel=1
pkgdesc="Free/libre implementation of The Settlers II game engine"
arch=("x86_64")
url="https://siedler25.org/"
license=("GPL3")
makedepends=("cmake" "git" "boost" "mesa" "sdl_mixer" "sdl2_mixer" "curl" "lua53" "miniupnpc" "libsamplerate")
depends=("boost-libs" "libgl" "sdl_mixer" "sdl2_mixer" "miniupnpc" "lua53" "libsamplerate")
optdepends=("siedler2-data")
conflicts=("return-to-the-roots" "s25rttr" "s25rttr-nightly-bin")
provides=("return-to-the-roots")
install="return-to-the-roots.install"
changelog="ChangeLog"
source=("git+https://github.com/Return-To-The-Roots/s25client.git"
        "git+https://github.com/Return-To-The-Roots/languages.git"
        "git+https://github.com/satoren/kaguya.git"
        "git+https://github.com/Return-To-The-Roots/libendian.git"
        "git+https://github.com/Return-To-The-Roots/liblobby.git"
        "git+https://github.com/Return-To-The-Roots/libsiedler2.git"
        "git+https://github.com/Return-To-The-Roots/libutil.git"
        "git+https://github.com/Return-To-The-Roots/mygettext.git"
        "git+https://github.com/Return-To-The-Roots/s-c.git"
        "git+https://github.com/Return-To-The-Roots/s25edit.git"
        "git+https://github.com/Return-To-The-Roots/s25update.git"
        "git+https://github.com/Return-To-The-Roots/version.git"
        "git+https://github.com/mat007/turtle.git"
        "rttr.sh" "return-to-the-roots.install")
sha256sums=("SKIP"
            "SKIP"
            "SKIP"
            "SKIP"
            "SKIP"
            "SKIP"
            "SKIP"
            "SKIP"
            "SKIP"
            "SKIP"
            "SKIP"
            "SKIP"
            "SKIP"
            "b623d74292ca332b65290f15adb0c41994a80eb4f5d247c713a0d43775f9e8f8"
            "888a1cd55350971ec3660de79c82760be63ed40617e8ef6931c20b07bc73e1a9")

pkgver() {
	cd "s25client/"
	echo "r$(git rev-list --count HEAD).$(git describe --always)"
}

prepare() {
	cd "s25client/"

	# Link to prepared submodules
	git config submodule.RTTR/languages.url $srcdir/languages
	git config submodule.contrib/kaguya.url $srcdir/kaguya
	git config submodule.libendian.url $srcdir/libendian
	git config submodule.liblobby.url $srcdir/liblobby
	git config submodule.libsiedler2.url $srcdir/libsiedler2
	git config submodule.libutil.url $srcdir/libutil
	git config submodule.mygettext.url $srcdir/mygettext
	git config submodule.s-c.url $srcdir/s-c
	git config submodule.s25edit.url $srcdir/s25edit
	git config submodule.s25update.url $srcdir/s25update
	git config submodule.version.url $srcdir/version
	git config submodule.contrib/turtle.url $srcdir/turtle

	# Get modules
	git submodule update
}

build() {
	cd s25client

	# Build
	mkdir -p build && cd build

	# NOTE: Wno-error=stringop-overflow is added to bypass an error in
	#       25client/libs/s25main/GamePlayer.cpp:328
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
	      -DBUILD_TESTING=Off \
	      -DCMAKE_CXX_FLAGS="-Wno-error=stringop-overflow" \
	      -DRTTR_BINDIR="bin" -DRTTR_DATADIR="share/s25rttr" \
	      -DRTTR_LIBDIR="lib/s25rttr" -DRTTR_EXTRA_BINDIR="bin" \
	      -DRTTR_USE_SYSTEM_SAMPLERATE=On \
	      -DLUA_INCLUDE_DIR=/usr/include/lua5.3/ ..
	make
}

package() {
	cd "s25client/build"

	# Use make based installer
	make install

	# Deal with extra binaries
	rm ${pkgdir}/usr/bin/s25update

	# Copy launch script
	install -Dm755 "${srcdir}/rttr.sh" "${pkgdir}/usr/bin"

	# Get additional files
	mkdir -p ${pkgdir}/usr/share/applications
	cp "${srcdir}/s25client/tools/release/debian/s25rttr.desktop" "${pkgdir}/usr/share/applications/"

	mkdir -p ${pkgdir}/usr/share/pixmaps
	cp "${srcdir}/s25client/tools/release/debian/s25rttr.png" "${pkgdir}/usr/share/pixmaps/"
}
