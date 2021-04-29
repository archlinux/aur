# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=avs-alexa-sampleapp
pkgver=1.23.0
pkgrel=5
pkgdesc="Alexa sample app originally packaged with the AVS SDK"
arch=('any')
url="https://github.com/alexa/avs-device-sdk"
license=('Apache')
makedepends=('cmake' 'gcc49')
depends=('portaudio' 'gstreamer' 'gst-plugins-base-libs' 'avs-device-sdk')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alexa/avs-device-sdk/archive/v${pkgver}.tar.gz"
	"CMakeLists.txt_1"
	"CMakeLists.txt_2"
	"avs-alexa-sampleapp.service"
	"headless.patch")
sha512sums=('7553532428687fa38522bf6b7eaa12b040e88ecf6d2fa181a3a48d1df380b49cb16ce0d98063106377e1dbeeff1177f25b4af18110b6d00957d59e68cde229b9'
            '085f58cc2c2a9947e9887ab9fd14497ec2238781821a19decea61496501a5d54d958fbd4372abefae6be8f8540d1b846dce84f1a17b736132e8a6adc3bfe613a'
            'cdb9c17b5ba872aaa0c098af910fd74dd769c96909980d0143b0a02b0442db3cec7385cfb5c489b583db25ecd92b2fc53e613a59bf2a643cd3213e1981132504'
            '1d272b710e631fcd3526e8aa453a9283f7b113406a863e675c7a9dd2ee211e9a241e8514c3d85327e297c202a923e5909917c3ada4ff8594e68aaf5d0e0c0721'
            '3b87661cece96ed3a9c8fbdb34d5da256613090c6282ba20a16c84be5223023b60fcf3033020a3afbdcee7fb652aa6466dcaa47a02f27ff90496e8b2338f47f7')
install="avs-alexa-sampleapp.install"

prepare() {
	cd "${srcdir}"
	cp "CMakeLists.txt_1" "avs-device-sdk-${pkgver}/SampleApp/CMakeLists.txt"
	cp "CMakeLists.txt_2" "avs-device-sdk-${pkgver}/SampleApp/src/CMakeLists.txt"
	cd "avs-device-sdk-${pkgver}/SampleApp"
	patch -p1 < "${srcdir}/headless.patch"
}

build() {
	cd "${srcdir}"
	mkdir -p build
	cd build
	# use older gcc version to avoid bugs
	export CC="/usr/bin/gcc-4.9"
	export CXX="/usr/bin/g++-4.9"
	# removing -fno-plt usually defined in /etc/makepkg.conf
	export CFLAGS="-march=x86-64 -mtune=generic -O2 -pipe"
	export CXXFLAGS="-march=x86-64 -mtune=generic -O2 -pipe"
	cmake "../avs-device-sdk-${pkgver}/SampleApp" \
		-DCMAKE_PREFIX_PATH=/usr \
		-DKWD=ON \
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
