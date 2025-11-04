# Maintainer: sfn

pkgbase='zl-compressor'
pkgname=('zl-compressor-vst' 'zl-compressor-lv2')
groups=('zl-audio' 'pro-audio')
pkgver=0.2.1
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
		"git+https://github.com/ZL-Audio/JUCE#tag=b251f82")
sha256sums=('33f25b78ceff2dde6be7fbc5bd20eb5f17f0cdcdb87a0bc731cbac944f7a6f5d'
            '7aaa927395bce6845b844e775786859e79b2e41dd857a0adee923b93dd183213'
            '01016c0970367a0da9f4bf3b9191334dbdbf8902e2acb6f47be0ede2acf598d7')

prepare() {
	cd ZLCompressor
	
	git submodule init
	git config submodule."kfr".url "${srcdir}/kfr"
	git config submodule."JUCE".url "${srcdir}/JUCE"
	git -c protocol.file.allow=always submodule update JUCE kfr


    # Use system kfr (broken due to libc++/libstdc++ symbol in
    #sed 's|add_subdirectory(kfr)|find_package(KFR CONFIG REQUIRED)|' -i CMakeLists.txt

	cmake -B Builds \
		 -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ \
	     -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_C_FLAGS="$CFLAGS" -DCMAKE_CXX_FLAGS="$CXXFLAGS -stdlib=libc++ -lc++abi" -DCMAKE_SKIP_INSTALL_RPATH=YES \
	     -DZL_JUCE_COPY_PLUGIN=FALSE -DZL_JUCE_FORMATS="VST3;LV2" .
}

build() {
	cd ZLCompressor
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
