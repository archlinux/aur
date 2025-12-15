# Maintainer: sfn

pkgbase='zl-equalizer'
pkgname=('zl-equalizer-vst' 'zl-equalizer-lv2' 'zl-equalizer')
groups=('zl-audio' 'pro-audio')
pkgver=1.1.0
pkgrel=2
options=()
pkgdesc="Parametric, dynamic equalizer plugin by ZL Audio"
arch=('x86_64')
url="https://zl-audio.github.io/plugins/zlequalizer2/"
license=('AGPL-3.0')
depends=('alsa-lib' 'libx11' 'libxinerama' 'libxext' 'freetype2' 'fontconfig' 'webkit2gtk' 'glu' 'nlopt')
makedepends=('git' 'cmake' 'kfr')

source=("git+https://github.com/ZL-Audio/ZLEqualizer#tag=${pkgver}"
		"git+https://github.com/ZL-Audio/JUCE#tag=6bd3353")
sha256sums=('046e44737dd27df571a9330d709f7edb5406a61919493741844a718d3b330338'
            '2adccbf0b7e52a90a16956955dbbef14924af56086157cfbef7607ac83faf4e5')

prepare() {
	cd ZLEqualizer

	git submodule init
	git config submodule."JUCE".url "${srcdir}/JUCE"
	git -c protocol.file.allow=always submodule update JUCE

	# Use system kfr and nlopt
	sed 's|add_subdirectory(kfr)|find_package(KFR CONFIG REQUIRED)|' -i CMakeLists.txt
	sed 's|add_subdirectory(nlopt)|find_package(NLopt CONFIG REQUIRED)|' -i CMakeLists.txt
}

build() {
	cd ZLEqualizer

	cmake -B Builds \
	      -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_C_FLAGS="$CFLAGS" -DCMAKE_CXX_FLAGS="$CXXFLAGS" -DCMAKE_SKIP_INSTALL_RPATH=YES \
	      -DZL_JUCE_COPY_PLUGIN=FALSE -DZL_JUCE_FORMATS="VST3;LV2" -DZL_EQ_BAND_NUM=32 .
	make -C Builds
}

package_zl-equalizer-vst() {
	groups+=('vst-plugins')
	mkdir -p ${pkgdir}/usr/lib/vst3/
	cp -r ${srcdir}/ZLEqualizer/Builds/ZLEqualizer_artefacts/VST3/* ${pkgdir}/usr/lib/vst3/
	install -Dm755 ${srcdir}/ZLEqualizer/LICENSE.md ${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.md"
}

package_zl-equalizer-lv2() {
	groups+=('lv2-plugins')
	mkdir -p ${pkgdir}/usr/lib/lv2/
	cp -r ${srcdir}/ZLEqualizer/Builds/ZLEqualizer_artefacts/LV2/* ${pkgdir}/usr/lib/lv2/
	install -Dm755 ${srcdir}/ZLEqualizer/LICENSE.md ${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.md"
}

package_zl-equalizer() {
  depends+=('zl-equalizer-vst' 'zl-equalizer-lv2')
}
