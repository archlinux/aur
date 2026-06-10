# Maintainer: sfn

pkgbase='zl-compressor'
pkgname=('zl-compressor-vst3' 'zl-compressor-lv2' 'zl-compressor')
groups=('zl-audio' 'pro-audio')
pkgver=0.5.0
pkgrel=3
options=()
pkgdesc="Sidechain and oversample capable compressor plugin by ZL Audio"
arch=('x86_64')
url="https://zl-audio.github.io/plugins/zlcompressor/"
license=('AGPL-3.0')
depends=('expat' 'freetype2' 'fontconfig' 'nlopt' 'highway' 'zlib' 'bzip2' 'libpng' 'brotli')
makedepends=('git' 'cmake' 'kfr' 'at-spi2-core' 'cairo' 'gtk3' 'gdk-pixbuf2' 'glib2' 'harfbuzz' 'pango' 'libsoup3')

source=("git+https://github.com/ZL-Audio/ZLCompressor#tag=${pkgver}"
		"git+https://github.com/ZL-Audio/JUCE#tag=542dcc3"
		"git+https://github.com/ZL-Audio/zldsp_fft.git#tag=959ff31")
sha256sums=('1bdba1f65e2fb2332cff7c34e31009a66b337b340223f4b7419e37290d9dfa67'
            '9fd8b671b3f0d2001f9acc1a9c13b3e0d778c76ab884ee2c69f122ec68729659'
            'd31d805f958746d375debaa1790712e831c2e428aa693a2220013315ff08a882')

prepare() {
	cd ZLCompressor
	
	git submodule init
	git config submodule."JUCE".url "${srcdir}/JUCE"
	git config submodule."source/dsp/fft/zldsp_fft".url "${srcdir}/zldsp_fft"
	git -c protocol.file.allow=always submodule update JUCE "source/dsp/fft/zldsp_fft"


    # Use system libraries
    sed 's|add_subdirectory(kfr)|find_package(KFR CONFIG REQUIRED)|' -i CMakeLists.txt
    sed 's|add_subdirectory(highway)|find_package(hwy CONFIG REQUIRED)|' -i CMakeLists.txt
}

build () {
	cd ZLCompressor

	local CXXFLAGS="${CXXFLAGS//-Wp,-D_GLIBCXX_ASSERTIONS/}" # causes issues

	cmake -B Builds \
	     -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_C_FLAGS="$CFLAGS" -DCMAKE_CXX_FLAGS="$CXXFLAGS" -DCMAKE_SKIP_INSTALL_RPATH=YES \
	     -DZL_JUCE_COPY_PLUGIN=FALSE -DZL_JUCE_FORMATS="VST3;LV2" -DZL_HWY_STATIC_TARGET=SSE2 .
	make -C Builds
}

package_zl-compressor-vst3() {
	groups+=('vst3-plugins')
	pkgdesc+=' (VST3 version)'
	mkdir -p ${pkgdir}/usr/lib/vst3/ZL\ Compressor.vst3
	cp -r "${srcdir}/ZLCompressor/Builds/ZLCompressor_artefacts/VST3/ZL Compressor.vst3" "${pkgdir}/usr/lib/vst3/ZL Compressor.vst3"
	install -Dm755 ${srcdir}/ZLCompressor/LICENSE.md ${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.md"
}

package_zl-compressor-lv2() {
	groups+=('lv2-plugins')
	pkgdesc+=' (LV2 version)'
	mkdir -p ${pkgdir}/usr/lib/lv2/ZL\ Compressor.lv2
	cp -r "${srcdir}/ZLCompressor/Builds/ZLCompressor_artefacts/LV2/ZL Compressor.lv2" "${pkgdir}/usr/lib/lv2/ZL Compressor.lv2"
	install -Dm755 ${srcdir}/ZLCompressor/LICENSE.md ${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.md"
}

package_zl-compressor() {
    pkgdesc+=' (metapackage that requires all plugin formats)'
	depends+=('zl-compressor-vst3' 'zl-compressor-lv2')
}
