# Maintainer: osch <oliver@luced.de>
pkgname=surge-synthesizer
pkgver=1.6.3
scmver=1.6.3
pkgrel=1
pkgdesc="Surge Synthesizer plugin"
arch=('x86_64')
url="https://surge-synthesizer.github.io"
license=('GPL3')
groups=('vst-plugins' 'lv2-plugins')
depends=('cairo'     'fontconfig'          'freetype2'
         'libx11'    'xcb-util-cursor'     'xcb-util'
         'libxcb'    'xcb-util-renderutil' 'xcb-util-image'
         'ttf-lato'  'xdg-utils' 'zenity')
makedepends=('steinberg-vst36' 'premake-git' 'git')
provides=("surge-synthesizer")
conflicts=('surge-synthesizer')
source=("git+https://github.com/surge-synthesizer/surge.git")
options=()
md5sums=('SKIP')

prepare() {
	export VST2SDK_DIR="$srcdir/vst2sdk"

	cd "$srcdir"
	rm -rf vst2sdk
	mkdir  vst2sdk
	cd vst2sdk
	# Workaround for steinberg-vst36.git:
	ln -s /usr/include/vst36/pluginterfaces .
	mkdir -p public.sdk/source/
	cd public.sdk/source/
	ln -s /usr/include/vst36 vst2.x

	cd "$srcdir"
	cd surge
	git checkout release/$scmver
	git submodule sync
	git submodule update --init --recursive
	
	sed -i -e 's:dest_path="/:dest_path="$DEST_DIR/:' build-linux.sh
	sed -i -e 's:data_path="/:data_path="$DEST_DIR/:' build-linux.sh
	echo "$scmver" > VERSION
}

build() {
	export VST2SDK_DIR="$srcdir/vst2sdk"
	cd "$srcdir/surge"
	export MAKEFLAGS="-j1" # workaround for broken build script
	./build-linux.sh clean-all
	./build-linux.sh -p vst2 build
	./build-linux.sh -p vst3 build
	./build-linux.sh -p lv2  build
}

package() {
	export VST2SDK_DIR="$srcdir/vst2sdk"
	cd "$srcdir/surge"
	export DEST_DIR="$pkgdir"
	mkdir -p   "$DEST_DIR/usr/share"
	mkdir -p   "$DEST_DIR/usr/lib/vst"
	export MAKEFLAGS="-j1" # just to be sure (s.a.)
	./build-linux.sh -p vst2 install
	./build-linux.sh -p vst3 install
	./build-linux.sh -p lv2  install
	mkdir -p   "$DEST_DIR/usr/share/Surge/doc"
	cp LICENSE "$DEST_DIR/usr/share/Surge/doc"
}
