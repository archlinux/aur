# Maintainer:
pkgname=mqtt-cpp
pkgver=13.1.0
pkgrel=0
pkgdesc='MQTT client/server for C++14 based on Boost.Asio'
arch=('x86_64')
url='https://github.com/redboltz/mqtt_cpp'
license=('custom:Boost')
makedepends=('ninja' 'cmake')
depends=('boost' 'doxygen' 'openssl')
provides=('mqtt_cpp')

_build_directory=build
_install_directory=/usr

source=(
	"https://github.com/redboltz/mqtt_cpp/archive/refs/tags/v${pkgver}.tar.gz"
)

sha512sums=(
	"71907ba013d844d3b00c932b8598480067c0b2a2088ea95ae6d65a548145b851f6a25135f4e3c1e61cfc3831b024308e872f194bc9af7febe0036edc2e63b9d4"
)

prepare() {
	build_type=Release

	cmake -G Ninja \
		-S "${srcdir}"/mqtt_cpp-${pkgver} \
		-B "${srcdir}"/${_build_directory} \
		-DCMAKE_BUILD_TYPE=${build_type} \
		-DCMAKE_CONFIGURATION_TYPES:STRING=${build_type} \
		-DCMAKE_INSTALL_PREFIX:PATH=${_install_directory} \
		-DMQTT_BUILD_EXAMPLES=OFF \
		-DMQTT_BUILD_TESTS=OFF \
		-DMQTT_ALWAYS_SEND_REASON_CODE=ON \
		-DMQTT_USE_STATIC_BOOST=OFF \
		-DMQTT_USE_STATIC_OPENSSL=OFF \
		-DMQTT_USE_TLS=ON \
		-DMQTT_USE_WS=ON \
		-DMQTT_USE_STR_CHECK=ON \
		-DMQTT_USE_LOG=ON \
		-DMQTT_STD_VARIANT=OFF \
		-DMQTT_STD_OPTIONAL=OFF \
		-DMQTT_STD_STRING_VIEW=OFF \
		-DMQTT_STD_ANY=OFF \
		-DMQTT_STD_SHARED_PTR_ARRAY=OFF \
		-DMQTT_DISABLE_LIBSTDCXX_TUPLE_ANY_WORKAROUND=OFF \
		-DMQTT_NO_TS_EXECUTORS=OFF
}

build() {
	cd "${srcdir}"/${_build_directory}
	ninja
}

package() {
	cd "${srcdir}"/${_build_directory}
	DESTDIR="${pkgdir}" ninja install

	mkdir -p "${pkgdir}"/usr/share/licenses/mqtt_cpp
	cp -ar "${srcdir}"/mqtt_cpp-${pkgver}/LICENSE_1_0.txt "${pkgdir}"/usr/share/licenses/mqtt_cpp
}
