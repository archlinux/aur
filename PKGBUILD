# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=avs-device-sdk
pkgver=1.12
pkgrel=1
pkgdesc="SDK for commercial device makers to integrate Alexa directly into connected products"
arch=(x86_64 i686)
url="https://github.com/alexa/avs-device-sdk"
license=('Apache')
makedepends=('cmake')
depends=('portaudio' 'gstreamer' 'gst-plugins-base-libs' 'snowboy' 'cblas')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alexa/avs-device-sdk/archive/v${pkgver}.tar.gz")
sha512sums=('9ea17eb76bbc6f4d478c33f1c2b4c7b4cd7250a07ea19a4795520e8f359df1fbe39bb18ff7fd97143eb95934eb62d87127c06029890c425c06ab57ab3fb4fe08')

prepare() {
	sed -i 's/blas/cblas/' "${srcdir}/avs-device-sdk-${pkgver}/KWD/KittAi/src/CMakeLists.txt"
}

build() {
	cd "${srcdir}"
	mkdir -p build
	cd build
	cmake "../avs-device-sdk-${pkgver}" \
		-DCMAKE_INSTALL_PREFIX:PATH=/usr \
		-DKITTAI_KEY_WORD_DETECTOR=ON \
		-DKITTAI_KEY_WORD_DETECTOR_LIB_PATH="/usr/lib/libsnowboy-detect.a" \
		-DKITTAI_KEY_WORD_DETECTOR_INCLUDE_DIR="/usr/include/libsnowboy-detect.h" \
		-DGSTREAMER_MEDIA_PLAYER=ON \
		-DPORTAUDIO=ON \
		-DPORTAUDIO_LIB_PATH="/usr/lib/libportaudio.so" \
		-DPORTAUDIO_INCLUDE_DIR="/usr/include"
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}" install
	install -Dm 555 "${srcdir}/avs-device-sdk-${pkgver}/tools/Install/genConfig.sh" "${pkgdir}/usr/share/avs-device-sdk/genConfig"
	install -D "${srcdir}/avs-device-sdk-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
