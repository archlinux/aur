# Maintainer: sfn

pkgbase='zl-equalizer'
pkgname=('zl-equalizer-vst3' 'zl-equalizer-lv2' 'zl-equalizer')
groups=('zl-audio' 'pro-audio')
pkgver=1.2.2
pkgrel=1
options=()
pkgdesc="Parametric, dynamic equalizer plugin by ZL Audio"
arch=('x86_64')
url="https://zl-audio.github.io/plugins/zlequalizer2/"
license=('AGPL-3.0')
depends=('expat' 'freetype2' 'fontconfig' 'nlopt' 'highway' 'zlib' 'bzip2' 'libpng' 'brotli')
makedepends=('git' 'cmake' 'kfr' 'at-spi2-core' 'cairo' 'gtk3' 'gdk-pixbuf2' 'glib2' 'harfbuzz' 'pango' 'libsoup3')

source=("git+https://github.com/ZL-Audio/ZLEqualizer#tag=${pkgver}"
		"git+https://github.com/ZL-Audio/JUCE#tag=176e410"
		"git+https://github.com/ZL-Audio/zldsp_fft.git#tag=0215d7e")
sha256sums=('da183e02363f7b027edf7dfd78f13bbe9abfc29466114999fd69def68e20bc6f'
            'ac62a6e5d36059845cf2ad61b1004b5e2b358604d303894c8ea237269c0d22bd'
            '471edb86c89d5dc9fd60cb75e2768bfe86b34f7c072f0c9dd5f4c4f18b2e5671')

prepare() {
	cd ZLEqualizer

	git submodule init
	git config submodule."JUCE".url "${srcdir}/JUCE"
	git config submodule."source/dsp/fft/zldsp_fft".url "${srcdir}/zldsp_fft"
	git -c protocol.file.allow=always submodule update JUCE "source/dsp/fft/zldsp_fft"

	# Use system libraries
	sed 's|add_subdirectory(kfr)|find_package(KFR CONFIG REQUIRED)|' -i CMakeLists.txt
	sed 's|add_subdirectory(nlopt)|find_package(NLopt CONFIG REQUIRED)|' -i CMakeLists.txt
	sed 's|add_subdirectory(highway)|find_package(hwy CONFIG REQUIRED)|' -i CMakeLists.txt
}

build() {
	cd ZLEqualizer

	cmake -B Builds \
	      -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_C_FLAGS="$CFLAGS" -DCMAKE_CXX_FLAGS="$CXXFLAGS" -DCMAKE_SKIP_INSTALL_RPATH=YES \
	      -DZL_JUCE_COPY_PLUGIN=FALSE -DZL_JUCE_FORMATS="VST3;LV2" -DZL_EQ_BAND_NUM=32 -DZL_HWY_STATIC_TARGET=SSE2 .
	make -C Builds
}

package_zl-equalizer-vst3() {
	groups+=('vst3-plugins')
	pkgdesc+=' (VST3 version)'
	replaces+=('zl-equalizer-vst')
	mkdir -p ${pkgdir}/usr/lib/vst3/
	cp -r ${srcdir}/ZLEqualizer/Builds/ZLEqualizer_artefacts/VST3/* ${pkgdir}/usr/lib/vst3/
	install -Dm755 ${srcdir}/ZLEqualizer/LICENSE.md ${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.md"
}

package_zl-equalizer-lv2() {
	groups+=('lv2-plugins')
	pkgdesc+=' (LV2 version)'
	mkdir -p ${pkgdir}/usr/lib/lv2/
	cp -r ${srcdir}/ZLEqualizer/Builds/ZLEqualizer_artefacts/LV2/* ${pkgdir}/usr/lib/lv2/
	install -Dm755 ${srcdir}/ZLEqualizer/LICENSE.md ${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.md"
}

package_zl-equalizer() {
  pkgdesc+=' (metapackage that requires all plugin formats)'
  depends+=('zl-equalizer-vst3' 'zl-equalizer-lv2')
}
