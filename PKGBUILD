# Maintainer: sfn
# Contributor: Sam Whited <sam@samwhited.com>

pkgbase='zl-equalizer'
pkgname=('zl-equalizer-vst3' 'zl-equalizer-lv2' 'zl-equalizer')
groups=('zl-audio' 'pro-audio')
pkgver=1.4.2
pkgrel=1
options=()
pkgdesc="Parametric, dynamic equalizer plugin by ZL Audio"
arch=('x86_64')
url="https://zl-audio.github.io/plugins/zlequalizer2/"
license=('AGPL-3.0')
depends=('expat' 'freetype2' 'fontconfig' 'nlopt' 'highway' 'zlib' 'bzip2' 'libpng' 'brotli' 'alsa-lib')
makedepends=('git' 'cmake' 'at-spi2-core' 'cairo' 'gtk3' 'gdk-pixbuf2' 'glib2' 'harfbuzz' 'pango' 'libsoup3')

_jucehash="68492e3382af69761ade554dcd9de73861f914b6"

source=("git+https://github.com/ZL-Audio/ZLEqualizer#tag=${pkgver}"
		"https://github.com/ZL-Audio/JUCE/archive/${_jucehash}.zip"
		"git+https://github.com/ZL-Audio/zldsp_fft.git#tag=b741fb7")
sha256sums=('fff4adc7ba6eb75a1e55b5de22f6dab890e9ed418c01f70535110afe83a334e3'
            'dc31e6c12e54e53c1701c0a28f25bf7506ad59dfc4b20dc9072feaeb57cbab06'
            '121d7bfe65321c7d0e8f55522470c13263ea24717b657fc57313de20ca266ff1')

prepare() {
	cd "${srcdir}"

	cd ZLEqualizer

	# upstream broke cloneing from github so we manually download and place
	git submodule init
	#git config submodule."JUCE".url "${srcdir}/JUCE"
	git config submodule."zldsp_fft".url "${srcdir}/zldsp_fft"
	git -c protocol.file.allow=always submodule update zldsp_fft #JUCE

	cp -f -r -T "${srcdir}/JUCE-${_jucehash}" JUCE

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
