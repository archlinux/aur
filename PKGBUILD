# Maintainer : MorsMortium <morsmortium@disroot.org>
# Contributor: Ikosse <andre.lofgren@mailbox.org>

pkgname=harbour-amazfish
pkgver=2.9.0
pkgrel=1
pkgdesc="Companion application for Huami Devices and the Pinetime Infinitime"
arch=('x86_64' 'aarch64')
url="https://github.com/piggz/harbour-amazfish"
license=('GPL-3.0-only')
depends=(
	'qt5-base'
	'karchive5'
	'kdb'
	'kcontacts5'
	'qt5-location'
	'qt5-connectivity'
	'qtmpris'
	'nemo-qml-plugin-dbus'
	'kirigami2'
	'bluez-qt5'
)
makedepends=('git' 'cmake')
source=("https://github.com/piggz/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('9a311aeb425039b05e19cc5686d0c56bb46d9bb599ce13dd8a1602206c21280ea56c453051eeb4bac4620273406ebae001cc1a3cbf9e7967219415bd7cd725f4')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	if [ ! -d "./.git" ]; then
		git init
	fi

	if [ ! -f "./qble/.git" ]; then
		rm -rf qble
		git submodule add https://github.com/piggz/qble.git qble
		cd qble
		git checkout eb6192b
		cd ..
	fi

	if [ ! -f "./daemon/libwatchfish/.git" ]; then
		rm -rf daemon/libwatchfish
		git submodule add https://github.com/piggz/libwatchfish.git \
			daemon/libwatchfish
		cd daemon/libwatchfish
		git checkout 41b885d
		cd ../..
	fi

	if [ ! -f "./daemon/Qt-AES/.git" ]; then
		rm -rf daemon/Qt-AES
		git submodule add https://github.com/bricke/Qt-AES.git daemon/Qt-AES
		cd daemon/Qt-AES
		git checkout 04f16b2
		cd ../..
	fi

	sed -zi \
		's;install(FILES ${CMAKE_CURRENT_BINARY_DIR}/harbour-amazfish.service\n    DESTINATION  ${CMAKE_INSTALL_PREFIX}/lib/systemd/user);;g' \
		./daemon/CMakeLists.txt
	sed -zi \
		's;install(FILES ${o2_HDRS}\n    DESTINATION ${CMAKE_INSTALL_PREFIX}/include/o2\n);;g' \
		./ui/o2/src/CMakeLists.txt
}

build () {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p build
	cd build
	cmake -DFLAVOR=kirigami -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver/build"
	cmake --install . --prefix "${pkgdir}/usr"

	install -D -m644 "./daemon/harbour-amazfish.service" \
		"${pkgdir}/usr/lib/systemd/user/harbour-amazfish.service"
}
