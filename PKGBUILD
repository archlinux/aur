# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=avs-alexa-sampleapp
pkgver=1.11
pkgrel=2
pkgdesc="Alexa sample app originally packaged with the AVS SDK"
arch=('any')
url="https://github.com/alexa/avs-device-sdk"
license=('Apache')
makedepends=('cmake')
depends=('portaudio' 'gstreamer' 'gst-plugins-base-libs' 'avs-device-sdk')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alexa/avs-device-sdk/archive/v${pkgver}.tar.gz"
	"CMakeLists.txt_1"
	"CMakeLists.txt_2"
	"avs-alexa-sampleapp.service")
sha512sums=('8ddac6a258c8bc054e4eac3a65da1626294112c88da18e50d7359d980c380b392d0c81f5ac1f5faaceca7d19a72b408708a7f4d247246d5f6f24390b5236b1aa'
	    'cc5ec50623ecc726615b5c3c282f2fdbdbe6592dc19daa2b6a7d4f848e5b770dc387b1874c3a4596881c6435b5876e6418bba3191825b953ccdd1773e6138a9d'
	    'cdb9c17b5ba872aaa0c098af910fd74dd769c96909980d0143b0a02b0442db3cec7385cfb5c489b583db25ecd92b2fc53e613a59bf2a643cd3213e1981132504'
	    '2809638f18a91d37cd773ef2b62b294780e11e2cfa570e6fbfc7bf4b86741b96f1e990cd04acc472f8303472ac12d52e9088b26e47a7fb228de7fd8ab495be5b')
install="avs-alexa-sampleapp.install"

prepare() {
	cd "${srcdir}"
	cp "CMakeLists.txt_1" "avs-device-sdk-${pkgver}/SampleApp/CMakeLists.txt"
	cp "CMakeLists.txt_2" "avs-device-sdk-${pkgver}/SampleApp/src/CMakeLists.txt"
}

build() {
	cd "${srcdir}"
	mkdir -p build
	cd build
	cmake "../avs-device-sdk-${pkgver}/SampleApp" \
		-DCMAKE_PREFIX_PATH=/usr \
		-DGSTREAMER_MEDIA_PLAYER=ON \
		-DPORTAUDIO=ON \
		-DPORTAUDIO_LIB_PATH="/usr/lib/libportaudio.so" \
		-DPORTAUDIO_INCLUDE_DIR="/usr/include"
	make
}

package() {
	cd "${srcdir}/build"
	install -Dm755 "src/SampleApp" "${pkgdir}/usr/bin/avs-alexa-sampleapp"
	mkdir -p "${pkgdir}/var/lib/avs-alexa-sampleapp"
	install -D "${srcdir}/avs-device-sdk-${pkgver}/Integration/AlexaClientSDKConfig.json" "${pkgdir}/var/lib/avs-alexa-sampleapp/Integration/AlexaClientSDKConfig.json"
	install -D "${srcdir}/avs-device-sdk-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${srcdir}/avs-alexa-sampleapp.service" "${pkgdir}/usr/lib/systemd/system/avs-alexa-sampleapp.service"
}
