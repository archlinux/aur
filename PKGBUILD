# Maintainer: sfn

pkgbase='zl-compressor'
pkgname=('zl-compressor-vst3' 'zl-compressor-lv2' 'zl-compressor')
groups=('zl-audio' 'pro-audio')
pkgver=0.6.1
pkgrel=1
options=()
pkgdesc="Sidechain and oversample capable compressor plugin by ZL Audio"
arch=('x86_64')
url="https://zl-audio.github.io/plugins/zlcompressor/"
license=('AGPL-3.0')
depends=('expat' 'freetype2' 'fontconfig' 'nlopt' 'highway' 'zlib' 'bzip2' 'libpng' 'brotli' 'alsa-lib')
makedepends=('git' 'cmake' 'at-spi2-core' 'cairo' 'gtk3' 'gdk-pixbuf2' 'glib2' 'harfbuzz' 'pango' 'libsoup3')

_jucehash="e66b82515320d92a2224651f8ecc1c888a8ec3d8"

source=("git+https://github.com/ZL-Audio/ZLCompressor#tag=${pkgver}"
		"https://github.com/ZL-Audio/JUCE/archive/${_jucehash}.zip"
		"git+https://github.com/ZL-Audio/zldsp_fft.git#tag=b741fb7")
sha256sums=('41abf7fefb77ac5f0193b94ea51e1f2d7da1ef79cb2e932bdad407f2066f6781'
            '6a4189e1f3fc77ca9ff067966690f7a17ffaaee605e6711074fa6b72ef144cfd'
            '121d7bfe65321c7d0e8f55522470c13263ea24717b657fc57313de20ca266ff1')

prepare() {
	cd ZLCompressor

	# upstream broke cloneing from github so we manually download and place
	git submodule init
	git config submodule."JUCE".url "${srcdir}/JUCE"
	git config submodule."zldsp_fft".url "${srcdir}/zldsp_fft"
	git -c protocol.file.allow=always submodule update "zldsp_fft" #JUCE

	cp -f -r -T "${srcdir}/JUCE-${_jucehash}" JUCE

    # Use system libraries
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
	mkdir -p ${pkgdir}/usr/lib/vst3/
	cp -r ${srcdir}/ZLCompressor/Builds/ZLCompressor_artefacts/VST3/* ${pkgdir}/usr/lib/vst3/
	install -Dm755 ${srcdir}/ZLCompressor/LICENSE.md ${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.md"
}

package_zl-compressor-lv2() {
	groups+=('lv2-plugins')
	pkgdesc+=' (LV2 version)'
	mkdir -p ${pkgdir}/usr/lib/lv2/
	cp -r ${srcdir}/ZLCompressor/Builds/ZLCompressor_artefacts/LV2/* ${pkgdir}/usr/lib/lv2/
	install -Dm755 ${srcdir}/ZLCompressor/LICENSE.md ${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.md"
}

package_zl-compressor() {
    pkgdesc+=' (metapackage that requires all plugin formats)'
	depends+=('zl-compressor-vst3' 'zl-compressor-lv2')
}
