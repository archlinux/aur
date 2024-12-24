# Maintainer: Bart van Strien <bart.bes@gmail.com>
# Contributor: Linus Sjögren <thelinx@unreliablepollution.net>
# Contributor: Andrzej Giniewicz < gginiu@gmail.com >
pkgname=love-git
pkgver=20241223.3a6a36e2
pkgrel=1
pkgdesc="An open-source 2D game engine which uses the versatile Lua scripting language to create dynamic gaming experiences."
arch=(i686 x86_64 armv6h armv7h aarch64)
url="https://love2d.org/"
license=('Zlib')
depends=(
	'luajit' 'freetype2' 'openal' 'libvorbis' 'libmodplug'
	'sdl3' 'zlib' 'libtheora' 'harfbuzz' 'libogg' 'gcc-libs' 'glibc'
)
replaces=('love-hg')
source=('git+https://github.com/love2d/love')
makedepends=('git' 'cmake')
options=(!strip)
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/love"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
	msg "Generating makefiles"
	cmake -B build -S "$srcdir/love" \
		-DLOVE_EXE_NAME='love-git' \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DCMAKE_SKIP_INSTALL_RPATH=YES \
		-DLOVE_USE_SDL3=YES \
		-Wno-dev

	msg "Building"
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build

	# Skip installing desktop files, icons, etc
	rm -r "${pkgdir}/usr/share"

	# Install the license file
	install -D -m644 "${srcdir}/love/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=4 sw=4 noet:
