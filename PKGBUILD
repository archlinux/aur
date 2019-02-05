# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=avs-alexa-sampleapp
pkgver=1.11
pkgrel=1
pkgdesc="Alexa sample app originally packaged with the AVS SDK"
arch=('any')
url="https://github.com/alexa/avs-device-sdk"
license=('Apache')
makedepends=('cmake')
depends=('portaudio' 'gstreamer' 'gst-plugins-base-libs' 'avs-device-sdk')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alexa/avs-device-sdk/archive/v${pkgver}.tar.gz"
	"CMakeLists.txt_1"
	"CMakeLists.txt_2")
sha512sums=('8ddac6a258c8bc054e4eac3a65da1626294112c88da18e50d7359d980c380b392d0c81f5ac1f5faaceca7d19a72b408708a7f4d247246d5f6f24390b5236b1aa'
	    'cc5ec50623ecc726615b5c3c282f2fdbdbe6592dc19daa2b6a7d4f848e5b770dc387b1874c3a4596881c6435b5876e6418bba3191825b953ccdd1773e6138a9d'
	    'cdb9c17b5ba872aaa0c098af910fd74dd769c96909980d0143b0a02b0442db3cec7385cfb5c489b583db25ecd92b2fc53e613a59bf2a643cd3213e1981132504')

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
	install -Dm755 "src/SampleApp" "${pkgdir}/usr/bin/avs-sampleapp"
	install -D "${srcdir}/avs-device-sdk-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
