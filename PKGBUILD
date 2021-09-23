# Maintainer:  GodofGrunts <me@godofgrunts.xyz>

pkgname=libresprite-git
_pkgname=LibreSprite
pkgver=1.0.beta.1.r1.g2e35e53fd
pkgrel=1
pkgdesc='fork of last GPL version of aseprite - git version'
arch=('x86_64' 'i686')
url='https://github.com/LibreSprite/LibreSprite'
license=('GPL')
depends=('pixman' 'curl' 'lua' 'sdl2' 'sdl2_image' 'giflib' 'zlib' 'libpng' 'libjpeg-turbo' 'tinyxml' 'freetype2' 'libwebp')
makedepends=('cmake' 'ninja' 'gtest' 'git')

source=("git+https://github.com/LibreSprite/LibreSprite.git"
	"git+https://github.com/LibreSprite/duktape.git"
	"git+https://github.com/aseprite/simpleini.git"
	"git+https://github.com/aseprite/clip.git"
	"git+https://github.com/aseprite/flic.git"
	"git+https://github.com/dacap/observable.git"
	"git+https://github.com/aseprite/undo.git"
	"libresprite.desktop")

sha256sums=('SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'd246c14dc6c0d71d02aba337c15c23611c6e982687300c86167f37b9926af7ba')

conflicts=(aseprite aseprite-git aseprite-gpl libresprite)

_submodules=('duktape'
	'simpleini'
	'clip'
	'flic'
	'observable'
	'undo')

_submodules_path=('third_party/duktape'
	'third_party/simpleini'
	'src/clip'
	'src/flic'
	'src/observable'
	'src/undo')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"
	git submodule init
	for (( i=0; i<${#_submodules[@]}; i++ )); do
		git config submodule.${_submodules_path[$i]}.url "${srcdir}/${_submodules[$i]}"
	done
	git submodule update
}

build() {
	cd "$_pkgname"
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr -G Ninja ..
	ninja libresprite
}


package() {
	DESTDIR="$pkgdir" ninja install -C $_pkgname/build 
	install -Dm644 "$srcdir/libresprite.desktop" \
		"$pkgdir/usr/share/applications/libresprite.desktop"
	install -Dm644 "$pkgdir/usr/share/libresprite/data/icons/ase64.png" \
		"$pkgdir/usr/share/pixmaps/libresprite.png"
}

