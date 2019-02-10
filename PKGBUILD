# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=avs-device-sdk
pkgver=1.11
pkgrel=6
pkgdesc="SDK for commercial device makers to integrate Alexa directly into connected products"
arch=('any')
url="https://github.com/alexa/avs-device-sdk"
license=('Apache')
makedepends=('cmake' 'gcc49')
depends=('portaudio' 'gstreamer' 'gst-plugins-base-libs' 'snowboy' 'cblas')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alexa/avs-device-sdk/archive/v${pkgver}.tar.gz")
sha512sums=('8ddac6a258c8bc054e4eac3a65da1626294112c88da18e50d7359d980c380b392d0c81f5ac1f5faaceca7d19a72b408708a7f4d247246d5f6f24390b5236b1aa')

prepare() {
	sed -i 's/blas/cblas/' "${srcdir}/avs-device-sdk-${pkgver}/KWD/KittAi/src/CMakeLists.txt"
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
