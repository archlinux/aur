# Maintainer: sfn

pkgbase='zl-compressor'
pkgname=('zl-compressor-vst' 'zl-compressor-lv2' 'zl-compressor')
groups=('zl-audio' 'pro-audio')
pkgver=0.3.1
pkgrel=1
options=()
pkgdesc="Sidechain and oversample capable compressor plugin by ZL Audio"
arch=('x86_64')
url="https://zl-audio.github.io/plugins/zlcompressor/"
license=('AGPL-3.0')
depends=('alsa-lib' 'libx11' 'libxinerama' 'libxext' 'freetype2' 'fontconfig' 'webkit2gtk' 'glu' 'libc++')
makedepends=('git' 'cmake' 'clang')

source=("git+https://github.com/ZL-Audio/ZLCompressor#tag=${pkgver}"
		"git+https://github.com/ZL-Audio/kfr#tag=9a35250"
		"git+https://github.com/ZL-Audio/JUCE#tag=6bd3353")
sha256sums=('14f70a3b239afad93c510d3cf6d1db5d89ca5f0f2f602df67c8602ee42b7449b'
            '7aaa927395bce6845b844e775786859e79b2e41dd857a0adee923b93dd183213'
            '2adccbf0b7e52a90a16956955dbbef14924af56086157cfbef7607ac83faf4e5')

prepare() {
	cd ZLCompressor
	
	git submodule init
	git config submodule."kfr".url "${srcdir}/kfr"
	git config submodule."JUCE".url "${srcdir}/JUCE"
	git -c protocol.file.allow=always submodule update JUCE kfr


    # Use system kfr (broken due to libc++/libstdc++ symbol in
    #sed 's|add_subdirectory(kfr)|find_package(KFR CONFIG REQUIRED)|' -i CMakeLists.txt
}

build () {
	cd ZLCompressor

	cmake -B Builds \
		 -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ \
	     -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_C_FLAGS="$CFLAGS" -DCMAKE_CXX_FLAGS="$CXXFLAGS -stdlib=libc++ -lc++abi" -DCMAKE_SKIP_INSTALL_RPATH=YES \
	     -DZL_JUCE_COPY_PLUGIN=FALSE -DZL_JUCE_FORMATS="VST3;LV2" .
	make -C Builds
}

package_zl-compressor-vst() {
	groups+=('vst-plugins')
	mkdir -p ${pkgdir}/usr/lib/vst3/ZL\ Compressor.vst3
	cp -r "${srcdir}/ZLCompressor/Builds/ZLCompressor_artefacts/VST3/ZL Compressor.vst3" "${pkgdir}/usr/lib/vst3/ZL Compressor.vst3"
	install -Dm755 ${srcdir}/ZLCompressor/LICENSE.md ${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.md"
}

package_zl-compressor-lv2() {
	groups+=('lv2-plugins')
	mkdir -p ${pkgdir}/usr/lib/lv2/ZL\ Compressor.lv2
	cp -r "${srcdir}/ZLCompressor/Builds/ZLCompressor_artefacts/LV2/ZL Compressor.lv2" "${pkgdir}/usr/lib/lv2/ZL Compressor.lv2"
	install -Dm755 ${srcdir}/ZLCompressor/LICENSE.md ${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.md"
}

package_zl-compressor() {
	depends+=('zl-compressor-vst' 'zl-compressor-lv2')
}
