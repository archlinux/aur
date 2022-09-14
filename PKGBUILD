# Maintainer: Jakub 'Eremiell' Marek <eremiell at eremiell dot net>
# See also https://github.com/eremiell-aur/dpp-git
pkgname=dpp-git
_pkgname=DPP
pkgver=10.0.19.r5.4b73548a
pkgrel=1
pkgdesc="Lightweight and Scalable C++ Discord API Bot Library - git version"
arch=('x86_64')
url="https://dpp.dev/"
license=('Apache')
depends=('gcc-libs' 'openssl' 'zlib' 'opus' 'libsodium' 'nlohmann-json')
makedepends=('cmake' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname}.install"
changelog="${pkgname}.changelog"
source=("${pkgname}::git+https://github.com/brainboxdotcc/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "%s" "$(git describe --long --tag | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/v//g')"
}

prepare() {
	cd "${srcdir}/${pkgname}"
	find . \( -iname "*.h" -o -iname "*.cpp" \) -exec sed -i -E "s/dpp\/(nlohmann)\//\1\//" '{}' \+
	sed -i -E "s/install\(TARGETS dpp LIBRARY DESTINATION (.*)\)/install\(TARGETS dpp EXPORT dpp-targets LIBRARY DESTINATION \1\)\ninstall\(EXPORT dpp-targets DESTINATION \1\)/" "library/CMakeLists.txt"
	sed -i -E "s/libdpp/dpp/" "CMakeLists.txt" "cmake/libdpp-config.cmake"
	sed -i -E "s/libdpp-config/dpp-config/" "cmake/CPackSetup.cmake"
	mv "cmake/libdpp-config.cmake" "cmake/dpp-config.cmake"
	sed -i -E "s/^.*dpp\/nlohmann.*$//" "library/CMakeLists.txt"
	rm -rf "include/dpp/nlohmann"
}

build() {
	cd "${srcdir}/${pkgname}"
	mkdir -p build
	cd build
	cmake -DDPP_BUILD_TEST=OFF -DRUN_LDCONFIG=OFF -DDPP_NO_VCPKG=ON -DDPP_CORO=ON -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_MESSAGE=NEVER -Wno-dev ..
	make
}

package() {
	cd "${srcdir}/${pkgname}/build"
	make DESTDIR="${pkgdir}/" install
	rm -rf "${pkgdir}/usr/include/dpp-${pkgver%.*}"
	install -dm755 "${pkgdir}/usr/lib/cmake/${pkgname%-git}/"
	find "${pkgdir}" -iname "*.cmake" -exec mv -t "${pkgdir}/usr/lib/cmake/${pkgname%-git}" '{}' \+
	rm -rf "${pkgdir}/usr/lib/dpp-${pkgver%.*}/"
	find "${pkgdir}" -iname "*.cmake" -exec sed -i -E "s/\/dpp-${pkgver%.*}//g" '{}' \+
	sed -i -E "s/if\(_realCurr STREQUAL _realOrig\)/if\(1\)/" "${pkgdir}/usr/lib/cmake/${pkgname%-git}/dpp.cmake" "${pkgdir}/usr/lib/cmake/${pkgname%-git}/dpp-targets.cmake"
	sed -i -E "s/([ \(_]dpp)/\1::dpp/" "${pkgdir}/usr/lib/cmake/${pkgname%-git}/dpp-targets-noconfig.cmake"
}
