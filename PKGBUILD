# Maintainer: osch <oliver@luced.de>

pkgname=surge-complete
pkgver=1.7.1
pkgrel=1
pkgdesc="Surge Synthesizer for all possible plugin types (LV2/VST2/VST3)"
arch=('x86_64')
url="https://surge-synthesizer.github.io/"
license=('GPL3')
groups=('vst-plugins' 'lv2-plugins' 'vst3-plugins' 'pro-audio' )
depends=('cairo'     'fontconfig'          'freetype2' 
         'libx11'    'xcb-util-cursor'     'xcb-util'
         'libxcb'    'xcb-util-renderutil' 'xcb-util-image'
         'ttf-lato'  'xdg-utils'           'zenity'
         'gcc-libs'  'glibc'               'libxkbcommon-x11'
         'xcb-util-keysyms'  )
makedepends=('steinberg-vst36' 'premake-git' 'git' 'rsync'
             'cmake' 'libsndfile' 'lv2' 'python')
provides=("surge")
conflicts=('surge-synthesizer' 'surge')
source=("surge-${pkgver}.tgz::https://github.com/surge-synthesizer/releases/releases/download/${pkgver}/SurgeSrc_${pkgver}.tgz")
sha512sums=('9fd9261a43037e761fb9e5e4f9f6d931e2ce18a0dd86aff23a2e0cac39a82aa737fbe28f8ee06fa735d3ae39acbb467db88e8f81f3c7f1ae39bee3f6565804c6')
b2sums=('2ec20a5be006a6e619a5e88747a2730524ca9f65b5af015843f5aeb1dd791f561739152eee5efd945e2d20ab940fc929e90dd0623db3044a9287a86621075420')

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
	sed -i -e 's:dest_path="/:dest_path="$DEST_DIR/:' build-linux.sh
	sed -i -e 's:data_path="/:data_path="$DEST_DIR/:' build-linux.sh
	echo "$pkgver" > VERSION
        sed -e "s/@SURGE_BUILD_ARCH@/${CARCH}/g" \
            -e "s/@SURGE_FULL_VERSION@/${pkgver}/g" \
            -i src/common/version.cpp.in
}

build() {
	cd "$srcdir/surge"
	export VST2SDK_DIR="$srcdir/vst2sdk"
	export MAKEFLAGS="-j1" # workaround for broken build script
	./build-linux.sh clean-all
	./build-linux.sh -p vst2     build
	./build-linux.sh -p vst3     build
	./build-linux.sh -p lv2      build
	./build-linux.sh -p headless build
}

package() {
	cd "$srcdir/surge"
	export VST2SDK_DIR="$srcdir/vst2sdk"
	export DEST_DIR="$pkgdir"
	mkdir -p   "$DEST_DIR/usr/share"
	mkdir -p   "$DEST_DIR/usr/lib/vst"
	export MAKEFLAGS="-j1" # just to be sure (s.a.)
	./build-linux.sh -p vst2     install
	./build-linux.sh -p vst3     install
	./build-linux.sh -p lv2      install
	./build-linux.sh -p headless install
	mkdir -p     "$DEST_DIR/usr/share/surge/doc"
	cp LICENSE   "$DEST_DIR/usr/share/surge/doc"
	cp AUTHORS   "$DEST_DIR/usr/share/surge/doc"
	cp README.md "$DEST_DIR/usr/share/surge/doc"
}
