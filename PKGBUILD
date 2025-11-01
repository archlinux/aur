# Maintainer: sfn

pkgname='zl-equalizer'
pkgver=0.6.2
pkgrel=3
options=()
pkgdesc="Parametric, dynamic equalizer plugin by ZL Audio"
arch=('x86_64')
url="https://zl-audio.github.io/plugins/zlequalizer/"
license=('AGPL-3.0')
depends=('alsa-lib' 'libx11' 'libxinerama' 'libxext' 'freetype2' 'fontconfig' 'webkit2gtk' 'glu')
makedepends=('git' 'cmake' 'ninja')

source=("git+https://github.com/ZL-Audio/ZLEqualizer#tag=${pkgver}"
		"git+https://github.com/ZL-Audio/JUCE#tag=b251f82"
		"git+https://github.com/ZL-Audio/kfr#tag=9a35250"
		"git+https://github.com/ZL-Audio/nlopt#tag=ab0fd1c")
sha256sums=('2f5e8a6cae87515b3f01f4dd7be60ee94f2ca3e87306964aad616a50114c8daf'
            '01016c0970367a0da9f4bf3b9191334dbdbf8902e2acb6f47be0ede2acf598d7'
            '7aaa927395bce6845b844e775786859e79b2e41dd857a0adee923b93dd183213'
            'b93b67f7a7533fc22b07f2bade668c169435db98a18a1cf39ed497cf8db78f33')

prepare() {
	cd ZLEqualizer
	
	git submodule init
	git update-index --add --cacheinfo 160000,b251f82228e35a11644e94db8fc806672a0fd3b7,JUCE # change commit because we can't pull upstream otherwise
	git config submodule."JUCE".url "${srcdir}/JUCE"
	git config submodule."kfr".url "${srcdir}/kfr"
	git config submodule."nlopt".url "${srcdir}/nlopt"
	git -c protocol.file.allow=always submodule update
	
	cmake -B Builds -G Ninja \
	      -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_C_FLAGS="$CFLAGS" -DCMAKE_CXX_FLAGS="$CXXFLAGS" -DCMAKE_SKIP_INSTALL_RPATH=YES \
	      -DZL_JUCE_COPY_PLUGIN=FALSE -DKFR_ENABLE_DFT=ON -DKFR_ENABLE_MULTIARCH=ON -DKFR_ARCHS="sse2;avx;avx2" -DZL_JUCE_FORMATS="VST3;LV2" -DZL_EQ_BAND_NUM=24 .
}

build() {
	cd ZLEqualizer
	cmake --build Builds
}

package() {
	mkdir -p ${pkgdir}/usr/lib/{vst3/ZL\ Equalizer.vst3,lv2/ZL\ Equalizer.lv2}
	cp -r "${srcdir}/ZLEqualizer/Builds/ZLEqualizer_artefacts/VST3/ZL Equalizer.vst3" "${pkgdir}/usr/lib/vst3/ZL Equalizer.vst3"
	cp -r "${srcdir}/ZLEqualizer/Builds/ZLEqualizer_artefacts/LV2/ZL Equalizer.lv2" "${pkgdir}/usr/lib/lv2/ZL Equalizer.lv2"
	install -Dm755 ${srcdir}/ZLEqualizer/LICENSE.md ${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.md"
}
