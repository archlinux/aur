# Maintainer: osch <oliver@luced.de>

pkgname=surge-complete
pkgver=1.9.0
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
         'xclip'     'xcb-util-keysyms' )
makedepends=('steinberg-vst36' 'premake' 'git' 'rsync'
             'cmake' 'libsndfile' 'lv2' 'python')
provides=("surge")
conflicts=('surge-synthesizer' 'surge')
source=("surge-${pkgver}.tgz::https://github.com/surge-synthesizer/releases/releases/download/${pkgver}/SurgeSrc_${pkgver}.tgz")
sha512sums=('f06caae297026e9bbccdb097a47341dc1abd17dc7988d8d46368bec202fe701b1b7c9614b441f8d00a5a3a4f386d870a2da86c422ddd7324db216de7baa00836')
b2sums=('b6574a48feefe6173afb2185be64423bb70d51d7376e9b5c44c4882d8e3e078c6b0430cb33aa23f9858a21db0be7b0dddfeebb57625149d79f066bb23639882e')

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
        sed -e 's/if(\${GIT_BRANCH} /if("\${GIT_BRANCH}" /g' \
            -e 's/ FIND \${GIT_BRANCH} / FIND "\${GIT_BRANCH}" /g' \
            -i cmake/versiontools.cmake
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
