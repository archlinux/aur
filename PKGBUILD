# Maintainer: Jon Gjengset <jon@thesquareplanet.com>
pkgname=milton-git
pkgver=1.5.0.r145.4dbc26e
pkgrel=1
pkgdesc="An infinite-canvas paint program"
arch=(x86_64)
url="https://github.com/serge-rgb/milton"
license=('GPL')
groups=()
depends=('opengl-driver' 'gtk2' 'libxi' 'ttf-carlito')
makedepends=('git' 'sdl2' 'icoutils')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/serge-rgb/milton.git'
        'no-main.patch' 'carlito-sys.patch' 'milton.desktop')
noextract=()
sha256sums=('SKIP'
            '9f97e9a168888d2d5e63e2d04e20c3e1c602ff95a975ccbf6d83537507375b6b'
            '04c4c462cf4ffb712f5df7a5a21013e343fbedd701a4948eaeb4e17915d14b3d'
            '59e5dec9b6ec0cfadc45e56728d83e66e612c84cfa67f15451df38ec0bad55d0')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | tr -d v | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch -Np1 -i "${srcdir}/no-main.patch"
	patch -Np1 -i "${srcdir}/carlito-sys.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"

	# see build-lin.sh in the git repo
	pushd third_party/SDL2-2.0.8
	mkdir -p build/linrelease
	pushd build/linrelease > /dev/null
	cmake \
	    -D ARTS:BOOL=OFF \
	    -D ALSA:BOOL=OFF \
	    -D PULSEAUDIO:BOOL=OFF \
	    -D OSS:BOOL=OFF \
	    -D ESD:BOOL=OFF \
	    -D SDL_SHARED:BOOL=OFF \
	    -D CMAKE_INSTALL_PREFIX="../linux64" \
	    -G "Unix Makefiles" \
	    -D CMAKE_DEBUG_POSTFIX="_debug" \
	    -D SDL_STATIC_PIC:BOOL=ON \
	    -D CMAKE_BUILD_TYPE="Debug" ../..
	make install
	popd > /dev/null
	popd

	mkdir -p build
	cd build
	cmake ..
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	cd build
	install -Dm755 Milton "${pkgdir}/usr/bin/milton"
	icotool -x milton_icon.ico
	for res in 16x16 32x32 48x48 64x64 128x128 256x256; do
		install -Dm644 milton_icon_*"_${res}x32.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/milton.png"
	done
	install -Dm644 "${srcdir}/milton.desktop" "${pkgdir}/usr/share/applications/milton.desktop"
}
