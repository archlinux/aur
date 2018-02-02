# Maintainer: Pierre Choffet <peuc@wanadoo.fr>

pkgname=return-to-the-roots
pkgver=r3846.7ba2df70
pkgrel=1
pkgdesc="Free/libre implementation of The Settlers II game engine"
arch=("i686" "x86_64")
url="https://siedler25.org/"
license=("GPL3")
makedepends=("cmake" "git" "boost" "sdl_mixer" "curl" "lua" "miniupnpc")
depends=("sdl_mixer" "miniupnpc" "boost-libs")
conflicts=("s25rttr" "s25rttr-nightly-bin")
install="return-to-the-roots.install"
changelog="ChangeLog"
source=("git+https://github.com/Return-To-The-Roots/s25client.git" "rttr.sh" "return-to-the-roots.install")
sha256sums=('SKIP' "b623d74292ca332b65290f15adb0c41994a80eb4f5d247c713a0d43775f9e8f8" "edb41253442928a2313f856021c06f6d2999b780f0426c05cd7bdb2381a627ea")

pkgver() {
	cd "s25client/"
	echo "r$(git rev-list --count HEAD).$(git describe --always)"
}

prepare() {
	cd "s25client/"

	# Get modules
	git submodule update --init --recursive

	# NOTE: Upstream is using a custom version of boost nowide, so we have to
	#       keep it built in this package instead of using boost-nowide package.
	#       Patch for nowide is currently pending.
	#       Also, nowide is being integrated in official boost releases, so this
	#       package may break in future versions.
# 	sed -i '/ADD_SUBDIRECTORY(nowide\/src)/d' libutil/CMakeLists.txt
}

build() {
	cd "s25client/build/"

	# NOTE: Fix upstream make install problem in s-c since 056acfe5b75cf08d433e2b356758c1202b7ebdea
	sed -i 's/PARAMS="$PARAMS -DRTTR_BINDIR=$RTTR_BINDIR"/PARAMS="$PARAMS -DRTTR_BINDIR=$RTTR_BINDIR -DRTTR_EXTRA_BINDIR=$RTTR_BINDIR"/' cmake.sh

	./cmake.sh --prefix="${pkgdir}/usr" --RTTR_BINDIR="bin" --RTTR_DATADIR="share/s25rttr" --RTTR_LIBDIR="lib/s25rttr"
	make
}

package() {
	cd "s25client/build"

	# Use make based installer
	make install

	# Deal with binaries
	rm ${pkgdir}/usr/bin/s25update

	# Copy launch script
	install -Dm755 "${srcdir}/rttr.sh" "${pkgdir}/usr/bin"

	# Get additional files
	mkdir -p ${pkgdir}/usr/share/applications
	cp "${srcdir}/s25client/debian/s25rttr.desktop" "${pkgdir}/usr/share/applications/"

	mkdir -p ${pkgdir}/usr/share/pixmaps
	cp "${srcdir}/s25client/debian/s25rttr.png" "${pkgdir}/usr/share/pixmaps/"
}
