# Maintainer: Jakub 'Eremiell' Marek <eremiell at eremiell dot net>
# See also https://github.com/eremiell-aur/dpp
pkgname=dpp
_pkgname=DPP
pkgver=10.0.15
pkgrel=1
pkgdesc="Lightweight and Scalable C++ Discord API Bot Library"
arch=('x86_64')
url="https://dpp.dev/"
license=('Apache')
depends=('gcc-libs' 'openssl' 'zlib' 'opus' 'libsodium' 'nlohmann-json')
makedepends=('cmake')
install="${pkgname}.install"
changelog="${pkgname}.changelog"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/brainboxdotcc/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5370e7fa3e76ed78b87dc4d9c01cc5a5f1a5789ebf1d3d0e8deff05cb665c539')

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	find . \( -iname "*.h" -o -iname "*.cpp" \) -exec sed -i -E "s/dpp\/(nlohmann)\//\1\//" '{}' \+
	sed -i -E "s/install\(TARGETS dpp LIBRARY DESTINATION (.*)\)/install\(TARGETS dpp EXPORT dpp-targets LIBRARY DESTINATION \1\)\ninstall\(EXPORT dpp-targets DESTINATION \1\)/" "library/CMakeLists.txt"
	sed -i -E "s/libdpp/dpp/" "CMakeLists.txt" "cmake/libdpp-config.cmake"
	sed -i -E "s/libdpp-config/dpp-config/" "cmake/CPackSetup.cmake"
	mv "cmake/libdpp-config.cmake" "cmake/dpp-config.cmake"
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	mkdir -p build
	cd build
	cmake -DDPP_BUILD_TEST=OFF -DRUN_LDCONFIG=OFF -DDPP_NO_VCPKG=ON -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_MESSAGE=NEVER -Wno-dev ..
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}/build"
	make DESTDIR="${pkgdir}/" install
	rm -rf "${pkgdir}/usr/include/dpp/nlohmann"
	rm -rf "${pkgdir}/usr/include/dpp-${pkgver%.*}"
	install -dm755 "${pkgdir}/usr/lib/cmake/${pkgname}/"
	find "${pkgdir}" -iname "*.cmake" -exec mv -t "${pkgdir}/usr/lib/cmake/${pkgname}" '{}' \+
	rm -rf "${pkgdir}/usr/lib/dpp-${pkgver%.*}/"
	find "${pkgdir}" -iname "*.cmake" -exec sed -i -E "s/\/dpp-${pkgver%.*}//g" '{}' \+
	sed -i -E "s/if\(_realCurr STREQUAL _realOrig\)/if\(1\)/" "${pkgdir}/usr/lib/cmake/dpp/dpp.cmake" "${pkgdir}/usr/lib/cmake/dpp/dpp-targets.cmake"
	sed -i -E "s/([ \(_]dpp)/\1::dpp/" "${pkgdir}/usr/lib/cmake/dpp/dpp-targets-noconfig.cmake"
}
