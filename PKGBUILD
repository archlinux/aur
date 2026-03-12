# Maintainer: sfn

pkgbase='zl-splitter'
pkgname=('zl-splitter-vst3' 'zl-splitter-lv2' 'zl-splitter')
groups=('zl-audio' 'pro-audio')
pkgver=0.2.1
pkgrel=3
options=()
pkgdesc="Sidechain and oversample capable splitter plugin by ZL Audio"
arch=('x86_64')
url="https://zl-audio.github.io/plugins/zlsplitter/"
license=('AGPL-3.0')
depends=('alsa-lib' 'libx11' 'libxinerama' 'libxext' 'freetype2' 'fontconfig' 'webkit2gtk' 'glu')
makedepends=('git' 'cmake')

source=("git+https://github.com/ZL-Audio/ZLSplitter#tag=${pkgver}"
		"git+https://github.com/ZL-Audio/JUCE#tag=6bd3353")
sha256sums=('b098ba5c365a9318eed3f07f8b02b4b8235703ec521bd22a2a2280d3d5756e6c'
            '2adccbf0b7e52a90a16956955dbbef14924af56086157cfbef7607ac83faf4e5')

prepare() {
	cd ZLSplitter
	
	git submodule init
	git config submodule."JUCE".url "${srcdir}/JUCE"
	git -c protocol.file.allow=always submodule update JUCE kfr


    # Use system kfr
    sed 's|add_subdirectory(kfr)|find_package(KFR CONFIG REQUIRED)|' -i CMakeLists.txt
}

build() {
	cd ZLSplitter

	local CXXFLAGS="${CXXFLAGS//-Wp,-D_GLIBCXX_ASSERTIONS/}" # causes issues

	cmake -B Builds \
	     -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_C_FLAGS="$CFLAGS" -DCMAKE_CXX_FLAGS="$CXXFLAGS" -DCMAKE_SKIP_INSTALL_RPATH=YES \
	     -DZL_JUCE_COPY_PLUGIN=FALSE -DZL_JUCE_FORMATS="VST3;LV2" .

	make -C Builds
}

package_zl-splitter-vst3() {
	groups+=('vst3-plugins')
	pkgdesc+=' (VST3 version)'
	mkdir -p ${pkgdir}/usr/lib/vst3/ZL\ Splitter.vst3
	cp -r "${srcdir}/ZLSplitter/Builds/ZLSplitter_artefacts/VST3/ZL Splitter.vst3" "${pkgdir}/usr/lib/vst3/ZL Splitter.vst3"
	install -Dm755 ${srcdir}/ZLSplitter/LICENSE.md ${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.md"
}

package_zl-splitter-lv2() {
	groups+=('lv2-plugins')
	pkgdesc+=' (LV2 version)'
	mkdir -p ${pkgdir}/usr/lib/lv2/ZL\ Splitter.lv2
	cp -r "${srcdir}/ZLSplitter/Builds/ZLSplitter_artefacts/LV2/ZL Splitter.lv2" "${pkgdir}/usr/lib/lv2/ZL Splitter.lv2"
	install -Dm755 ${srcdir}/ZLSplitter/LICENSE.md ${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.md"
}

package_zl-splitter() {
	depends+=('zl-splitter-vst3' 'zl-splitter-lv2')
}
