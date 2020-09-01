# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=avs-device-sdk
pkgver=1.20.1
pkgrel=1
pkgdesc="SDK for commercial device makers to integrate Alexa directly into connected products"
arch=(x86_64 i686)
url="https://github.com/alexa/avs-device-sdk"
license=('Apache')
makedepends=('cmake')
depends=('portaudio' 'gstreamer' 'gst-plugins-base-libs' 'snowboy' 'cblas' 'rapidjson')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alexa/avs-device-sdk/archive/v${pkgver}.tar.gz")
sha512sums=('1b1cde229918802b110d2bd6fc12552acb5ddb0a41a9792a9bcd7f469b88be103606d1ae30eaaa61f694b33eafb7c75ede2c2b35e394261b80a474f03191f0d1')

prepare() {
	sed -i 's/blas/cblas/' "${srcdir}/avs-device-sdk-${pkgver}/KWD/KittAi/src/CMakeLists.txt"
	sed -i '/^add_subdirectory("rapidjson")/d' "${srcdir}/avs-device-sdk-${pkgver}/ThirdParty/CMakeLists.txt"
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
