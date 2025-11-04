# Maintainer: Martin Rys <https://rys.rs/contact>
# Contributor: John Troxler <firstname dot lastname at gmail dot com>

# https://github.com/loot/libloot/issues/95
# Maybe add doxgen for /docs, but then we get the following error as `spdlog`` will be pulled:
#   /home/c0rn3j/AUR/loot/src/loot-0.23.1/src/gui/state/game/game.cpp:49:10: fatal error: spdlog/fmt/bundled/ranges.h: No such file or directory
#      49 | #include <spdlog/fmt/bundled/ranges.h>

# Things like OGDF are downloaded prebuilt, this needs to be fixed if we want to have a proper source package
# See cmake doc link below

# loot E: ELF files outside of a valid path ('opt/').
# loot E: Insecure RUNPATH '.' in file ('opt/loot/LOOT')
# loot E: Insecure RUNPATH '/opt/loot' in file ('opt/loot/LOOT')

pkgname=loot
# https://github.com/loot/loot/releases
pkgver=0.28.0
pkgrel=4
pkgdesc="A load order optimisation tool for Starfield, The Elder Scrolls (Morrowind and later) and Fallout (3 and later) games"
arch=('x86_64')
url="https://loot.github.io"
license=('GPL-3.0-only')
depends=(
	'fmt'
	'icu'
	'hicolor-icon-theme'
	'ogdf' # AUR
	'onetbb'
	'qt6-base'
	'libloot'
	'spdlog'
	'tomlplusplus'
	'zlib-ng')
makedepends=(
	'git'
	'boost'
	'cbindgen'
	'cmake'
	'python'
	'rust')
optdepends=(
	'vulkan-headers: Optional build dependency'
)
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/${pkgver}.tar.gz"
	'LOOT.desktop'
)
sha256sums=('098ed7b27e9036dfd9e23dc3c3232ae9c0f6dac1886ad860ba71475084437bb2'
            '3dd063fdbe33dc82a4298bd5bcd3b4e7490adab4128389c153d12c6b074b27fb')

prepare() {
	cd "${pkgname}-${pkgver}"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# Archive structure: https://github.com/loot/loot/issues/1990
	mkdir -p pkg/lib pkg/include
	cp /usr/lib/libloot.s* ./pkg/lib/
	cp -r /usr/include/loot ./pkg/include/
	tar -zcf "libloot.tar.gz" ./pkg/

	# https://github.com/loot/loot?tab=readme-ov-file#cmake-variables
	# TODO(Martim): Fix minizip, minizip-ng is not checked for
	#               and minizip does not have cmake files as they were added in 2025-02 for which there is no release
	# REQUIRE_FIND_PACKAGE definitions are there to prevent dependencies being gotten off network instead of system
	cmake -B build \
		-DCMAKE_REQUIRE_FIND_PACKAGE_libloot=ON \
		-DCMAKE_REQUIRE_FIND_PACKAGE_ZLIB=ON \
		-DCMAKE_REQUIRE_FIND_PACKAGE_MINIZIP=OFF \
		-DCMAKE_REQUIRE_FIND_PACKAGE_tomlplusplus=ON \
		-DCMAKE_REQUIRE_FIND_PACKAGE_fmt=ON \
		-DCMAKE_REQUIRE_FIND_PACKAGE_spdlog=ON \
		-DCMAKE_REQUIRE_FIND_PACKAGE_OGDF=ON \
		-DCMAKE_BUILD_WITH_INSTALL_RPATH=TRUE \
		-DCMAKE_INSTALL_RPATH="/opt/${pkgname}"
		#-DLIBLOOT_URL="${srcdir}/${pkgname}-${pkgver}/libloot.tar.gz" \
	cmake --build build
}

package() {
	_builddir="${srcdir}/${pkgname}-${pkgver}/build"

	install -Dm755 -t "${pkgdir}/opt/${pkgname}" "${_builddir}/LOOT"

	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/LOOT" "${pkgdir}/usr/bin"

	# Install the icon
	install -Dm644 "${_builddir}/../resources/icons/loot.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/loot.svg"
	# Install desktop entry
	install -Dm644 "${srcdir}/LOOT.desktop" "${pkgdir}/usr/share/applications/LOOT.desktop"
}
