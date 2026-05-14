# Maintainer: a2sc <a_dev at a2sc eu>
# Contributor: volkszaehler.org project
#
# Arch Linux PKGBUILD for vzlogger
# https://github.com/volkszaehler/vzlogger

pkgname=vzlogger
pkgver=0.8.7
_libsmlver=1.1.5
_libmbusver=0.9.0
_libmbusrel=git20250914-1
pkgrel=1
pkgdesc="Logging utility for various smart meters and sensors (volkszaehler.org)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/volkszaehler/vzlogger"
license=('GPL-3.0-or-later')
depends=(
	'curl'
	'libmicrohttpd'
	'mosquitto'
	'openssl'
	'libgcrypt'
	'libunistring'
	'util-linux-libs'	# libuuid
	'gnutls'
)
makedepends=(
	'cmake'
	'git'
	'pkg-config'
)
optdepends=(
	'volkszaehler: volkszaehler.org middleware backend'
)
backup=('etc/vzlogger.conf')
install="${pkgname}.install"
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/volkszaehler/vzlogger/archive/refs/tags/v${pkgver}.tar.gz"
	"libsml-${_libsmlver}.tar.gz::https://github.com/volkszaehler/libsml/archive/refs/tags/v${_libsmlver}.tar.gz"
	"libmbus-${_libmbusver}+${_libmbusrel}.tar.gz::https://github.com/volkszaehler/libmbus/archive/refs/tags/v${_libmbusver}+${_libmbusrel}.tar.gz"
	"vzlogger.service"
	"vzlogger.sysusers"
	"vzlogger.tmpfiles"
)
sha256sums=('4ae903d5467dfe79050d70b746ec9b2b8300ee0d39470a2a507e41b4567eda16'
            '58dbc19edab0122e28676acc62e456f964c71894b10ed55058bcab3f4e3a8cc7'
            'd9f8282f6a02736dfc7b1bf4a59771b0c7dfe84f444d76ded6a842b8595c1b44'
            'b5e921edf07041cb3752bad521f280ecef7ce9566d262b5c570e1a6981c84977'
            '1d8c0a07ac550fd46b9a26992e6e0201b9eb5147ad284ab5c6f2296b9eba21eb'
            '7aa92af2d2dc2df2503702ba98e565219015c5fde55d270cc69817a34eaab4d8')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"

    # Die Git-Versionsprüfung im CMakeLists.txt deaktivieren
    sed -i 's/get_git_head_revision/# get_git_head_revision/g' CMakeLists.txt
    sed -i 's/git_describe/# git_describe/g' CMakeLists.txt
	mkdir -p "${srcdir}/${pkgname}-${pkgver}/libs"

	rm -rf "${srcdir}/${pkgname}-${pkgver}/libs/libsml"
	cp -a "${srcdir}/libsml-${_libsmlver}" "${srcdir}/${pkgname}-${pkgver}/libs/libsml"
	rm -rf "${srcdir}/${pkgname}-${pkgver}/libs/libmbus"
	cp -a "${srcdir}/libmbus-${_libmbusver}-${_libmbusrel}" "${srcdir}/${pkgname}-${pkgver}/libs/libmbus"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    export CFLAGS="${CFLAGS/-D_FORTIFY_SOURCE=3/-D_FORTIFY_SOURCE=2}"
    export CXXFLAGS="${CXXFLAGS/-D_FORTIFY_SOURCE=3/-D_FORTIFY_SOURCE=2}"
	export LDFLAGS="$LDFLAGS -ljson-c"

    cd "libs/libsml"
    CFLAGS="$CFLAGS -fPIC" make
    
    cd "../libmbus"
    CFLAGS="$CFLAGS -fPIC" ./build.sh

	cmake \
        -B "${srcdir}/build" \
        -S "${srcdir}/${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -DBUILD_TEST=OFF \
        -DENABLE_MQTT=ON \
		-DJSON_INCLUDE_DIR=/usr/include/json-c \
		-DJSON_LIBRARY=/usr/lib/libjson-c.so \
		-DGIT_EXECUTABLE=/usr/bin/false \
		-DGIT_FOUND=FALSE \
        -DMICROHTTPD_INCLUDE_DIR=/usr/include \
        -DMICROHTTPD_LIBRARY=/usr/lib/libmicrohttpd.so \
        -DSML_INCLUDE_DIR="${srcdir}/${pkgname}-${pkgver}/libs/libsml/sml/include" \
        -DSML_LIBRARY="${srcdir}/${pkgname}-${pkgver}/libs/libsml/sml/lib/libsml.a" \
        -DMBUS_INCLUDE_DIR="${srcdir}/${pkgname}-${pkgver}/libs/libmbus" \
        -DMBUS_LIBRARY="${srcdir}/${pkgname}-${pkgver}/libs/libmbus/mbus/.libs/libmbus.a"

    cmake --build "${srcdir}/build" --parallel "$(nproc)"
}

package() {
	DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"

	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/etc/vzlogger.conf" \
		"${pkgdir}/etc/vzlogger.conf"

	install -Dm644 "${srcdir}/vzlogger.service" \
		"${pkgdir}/usr/lib/systemd/system/vzlogger.service"

	install -Dm644 "${srcdir}/vzlogger.sysusers" \
		"${pkgdir}/usr/lib/sysusers.d/vzlogger.conf"

	install -Dm644 "${srcdir}/vzlogger.tmpfiles" \
		"${pkgdir}/usr/lib/tmpfiles.d/vzlogger.conf"

	install -dm750 "${pkgdir}/var/log/${pkgname}"
}
