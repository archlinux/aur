# Maintainer: osch <oliver@luced.de>

pkgname=surge-complete
pkgver=1.8.1
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
sha512sums=('bdef088dc95e4253b03bfbd855c9d6d042130d6c387b2a30c0cb7795b1ac9878531e2ccd238fe9a219be259e6e3e1d533e5d885ec6e6d6def85c0defa0774c9e')
b2sums=('de7a21174da3742dc323936917351ae0e2913e8d98ed5d96d1ae45007bf1576496ac009f8a75bf00f1cc576aecb928b5d2c128fa212ca1728fc4be47dba9bae3')

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
