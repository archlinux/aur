# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=avs-device-sdk
pkgver=1.19.1
pkgrel=1
pkgdesc="SDK for commercial device makers to integrate Alexa directly into connected products"
arch=(x86_64 i686)
url="https://github.com/alexa/avs-device-sdk"
license=('Apache')
makedepends=('cmake')
depends=('portaudio' 'gstreamer' 'gst-plugins-base-libs' 'snowboy' 'cblas')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alexa/avs-device-sdk/archive/v${pkgver}.tar.gz")
sha512sums=('96edaa1b78a582b9b9253e27f5f12c6be8415874ea8edb9e54f14e4e115eaff9bde5b99c2002a54fb1c26bb31dae9e89e9ad4642e743c7460f6628cec6c1f94e')

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
