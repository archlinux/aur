# Maintainer: sfn

pkgbase='zl-splitter'
pkgname=('zl-splitter-vst3' 'zl-splitter-lv2' 'zl-splitter')
groups=('zl-audio' 'pro-audio')
pkgver=0.3.0
pkgrel=3
options=()
pkgdesc="Sidechain and oversample capable splitter plugin by ZL Audio"
arch=('x86_64')
url="https://zl-audio.github.io/plugins/zlsplitter/"
license=('AGPL-3.0')
depends=('expat' 'freetype2' 'fontconfig' 'nlopt' 'highway' 'zlib' 'bzip2' 'libpng' 'brotli')
makedepends=('git' 'cmake' 'kfr' 'at-spi2-core' 'cairo' 'gtk3' 'gdk-pixbuf2' 'glib2' 'harfbuzz' 'pango' 'libsoup3')

source=("git+https://github.com/ZL-Audio/ZLSplitter#tag=${pkgver}"
		"git+https://github.com/ZL-Audio/JUCE#tag=542dcc3")
sha256sums=('04031f27982ab58b341a5beb496b52a4f905cb9cf8349904af18192256a795a9'
            '9fd8b671b3f0d2001f9acc1a9c13b3e0d778c76ab884ee2c69f122ec68729659')

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
    pkgdesc+=' (metapackage that requires all plugin formats)'
	depends+=('zl-splitter-vst3' 'zl-splitter-lv2')
}
