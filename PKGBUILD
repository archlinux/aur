# Maintainer: Jakub 'Eremiell' Marek <eremiell at eremiell dot net>
# See also https://github.com/eremiell-aur/dpp
pkgname=dpp
_pkgname=DPP
pkgver=10.0.20
pkgrel=1
pkgdesc="Lightweight and Scalable C++ Discord API Bot Library"
arch=('x86_64')
url="https://dpp.dev/"
license=('Apache')
depends=('gcc-libs' 'openssl' 'zlib' 'opus' 'libsodium' 'nlohmann-json')
makedepends=('cmake' 'pkgconf')
install="${pkgname}.install"
changelog="${pkgname}.changelog"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/brainboxdotcc/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c4a7481c714c27d9c1411c668212e433fa5f6631a933676269c866295bd4ef73')

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	find . \( -iname "*.h" -o -iname "*.cpp" \) -exec sed -i -E "s/dpp\/(nlohmann)\//\1\//" '{}' \+
	sed -i -E "s/install\(TARGETS dpp LIBRARY DESTINATION (.*)\)/install\(TARGETS dpp EXPORT dpp-targets LIBRARY DESTINATION \1\)\ninstall\(EXPORT dpp-targets DESTINATION \1\)/" "library/CMakeLists.txt"
	sed -i -E "s/libdpp/dpp/" "CMakeLists.txt" "cmake/libdpp-config.cmake"
	sed -i -E "s/libdpp-config/dpp-config/" "cmake/CPackSetup.cmake"
	mv "cmake/libdpp-config.cmake" "cmake/dpp-config.cmake"
	sed -i -E "s/^.*dpp\/nlohmann.*$//" "library/CMakeLists.txt"
	rm -rf "include/dpp/nlohmann"
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	mkdir -p build
	cd build
	cmake -DDPP_BUILD_TEST=OFF -DRUN_LDCONFIG=OFF -DDPP_NO_VCPKG=ON -DDPP_CORO=ON -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_MESSAGE=NEVER -Wno-dev ..
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}/build"
	make DESTDIR="${pkgdir}/" install
	rm -rf "${pkgdir}/usr/include/dpp-${pkgver%.*}"
	install -dm755 "${pkgdir}/usr/lib/cmake/${pkgname}/"
	find "${pkgdir}" -iname "*.cmake" -exec mv -t "${pkgdir}/usr/lib/cmake/${pkgname}" '{}' \+
	rm -rf "${pkgdir}/usr/lib/dpp-${pkgver%.*}/"
	find "${pkgdir}" -iname "*.cmake" -exec sed -i -E "s/\/dpp-${pkgver%.*}//g" '{}' \+
	sed -i -E "s/if\(_realCurr STREQUAL _realOrig\)/if\(1\)/" "${pkgdir}/usr/lib/cmake/dpp/dpp.cmake" "${pkgdir}/usr/lib/cmake/dpp/dpp-targets.cmake"
	sed -i -E "s/([ \(_]dpp)/\1::dpp/" "${pkgdir}/usr/lib/cmake/dpp/dpp-targets-noconfig.cmake"
}
