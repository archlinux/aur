# Maintainer: sfn

pkgbase='zl-splitter'
pkgname=('zl-splitter-vst' 'zl-splitter-lv2' 'zl-splitter')
groups=('zl-audio' 'pro-audio')
pkgver=0.2.0
pkgrel=2
options=()
pkgdesc="Sidechain and oversample capable splitter plugin by ZL Audio"
arch=('x86_64')
url="https://zl-audio.github.io/plugins/zlsplitter/"
license=('AGPL-3.0')
depends=('alsa-lib' 'libx11' 'libxinerama' 'libxext' 'freetype2' 'fontconfig' 'webkit2gtk' 'glu' 'libc++')
makedepends=('git' 'cmake' 'clang')

source=("git+https://github.com/ZL-Audio/ZLSplitter#tag=${pkgver}"
		"git+https://github.com/ZL-Audio/kfr#tag=9a35250"
		"git+https://github.com/ZL-Audio/JUCE#tag=b251f82")
sha256sums=('f9e36d9b4e248087bc24c3fdde7da64aad502f6300f79e1c13ae70339daa4560'
            '7aaa927395bce6845b844e775786859e79b2e41dd857a0adee923b93dd183213'
            '01016c0970367a0da9f4bf3b9191334dbdbf8902e2acb6f47be0ede2acf598d7')

prepare() {
	cd ZLSplitter
	
	git submodule init
	git update-index --add --cacheinfo 160000,b251f82228e35a11644e94db8fc806672a0fd3b7,JUCE # change commit because we can't pull upstream otherwise
	git config submodule."JUCE".url "${srcdir}/JUCE"
	git config submodule."kfr".url "${srcdir}/kfr"
	git -c protocol.file.allow=always submodule update JUCE kfr


    # Use system kfr (broken due to libc++/libstdc++ symbol incompatibility)
    #sed 's|add_subdirectory(kfr)|find_package(KFR CONFIG REQUIRED)|' -i CMakeLists.txt

	cmake -B Builds \
		 -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ \
	     -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_C_FLAGS="$CFLAGS" -DCMAKE_CXX_FLAGS="${CXXFLAGS} -stdlib=libc++ -lc++abi" -DCMAKE_SKIP_INSTALL_RPATH=YES \
	     -DZL_JUCE_COPY_PLUGIN=FALSE -DZL_JUCE_FORMATS="VST3;LV2" .
}

build() {
	cd ZLSplitter
	make -C Builds
}

package_zl-splitter-vst() {
	groups+=('vst-plugins')
	mkdir -p ${pkgdir}/usr/lib/vst3/ZL\ Splitter.vst3
	cp -r "${srcdir}/ZLSplitter/Builds/ZLSplitter_artefacts/VST3/ZL Splitter.vst3" "${pkgdir}/usr/lib/vst3/ZL Splitter.vst3"
	install -Dm755 ${srcdir}/ZLSplitter/LICENSE.md ${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.md"
}

package_zl-splitter-lv2() {
	groups+=('lv2-plugins')
	mkdir -p ${pkgdir}/usr/lib/lv2/ZL\ Splitter.lv2
	cp -r "${srcdir}/ZLSplitter/Builds/ZLSplitter_artefacts/LV2/ZL Splitter.lv2" "${pkgdir}/usr/lib/lv2/ZL Splitter.lv2"
	install -Dm755 ${srcdir}/ZLSplitter/LICENSE.md ${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.md"
}

package_zl-splitter() {
	depends+=('zl-splitter-vst' 'zl-splitter-lv2')
}
