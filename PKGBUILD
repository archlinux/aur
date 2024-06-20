# Maintainer: Martin Rys <rys.rs/contact>
# Previous Maintainer: John Troxler <firstname dot lastname at gmail dot com>

pkgname=loot
# https://github.com/loot/loot/releases
pkgver=0.22.4
# https://github.com/loot/libloot/releases
_pkglibver=0.22.4
pkgrel=1
pkgdesc="A load order optimisation tool for the Elder Scrolls (Morrowind and later) and Fallout (3 and later) games."
arch=('x86_64')
url="https://loot.github.io"
license=('GPL-3.0-only')
depends=('boost-libs' 'libssh2' 'alsa-lib' 'nss' 'pango' 'atk' 'libxdamage' 'libxcomposite' 'libxcursor' 'libxrandr' 'libxss' 'libxtst' 'qt6-base' 'hicolor-icon-theme' 'onetbb')
## Maybe add doxgen for /docs, but then we get
#                 from /build/loot/src/libloot-0.22.4/src/api/api_database.cpp:32:
#/build/loot/src/libloot-0.22.4/src/api/metadata/yaml/message.h:29:10: fatal error: spdlog/fmt/bundled/args.h: No such file or directory
#   29 | #include <spdlog/fmt/bundled/args.h>
#      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
#compilation terminated.
#make[3]: *** [CMakeFiles/loot.dir/build.make:90: CMakeFiles/loot.dir/src/api/api_database.cpp.o] Error 1

makedepends=('git' 'boost' 'cbindgen' 'cmake' 'rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz"
        "lib$pkgname-$_pkglibver.tar.gz::https://github.com/$pkgname/lib$pkgname/archive/$_pkglibver.tar.gz"
        'LOOT.desktop'
)
sha256sums=('a7cf30ed89bb84d3d6843f121cedb528720403bda1b08b816f338cbae7cc5f8e'
            'f09c2b73cd0b03e1235f7eac1fc8089aafbeeead8d4f42add2e3753cac4f0bb7'
            '3dd063fdbe33dc82a4298bd5bcd3b4e7490adab4128389c153d12c6b074b27fb')

build() {
	# libloot
	cd "$srcdir/libloot-$_pkglibver"
	mkdir -p build
	cd build
	cmake .. \
		-DCMAKE_SKIP_RPATH=TRUE
	make loot

	mkdir -p pkg/lib
	cp libloot.so ./pkg/lib/libloot.so
	cp -r ../include/ ./pkg/
	tar -zcf libloot-$_pkglibver.tar.gz ./pkg/

	# loot
	cd "$srcdir/$pkgname-$pkgver"

	mkdir -p build
	cd build
	cmake .. \
		-DLIBLOOT_URL="$srcdir/lib$pkgname-$_pkglibver/build/lib$pkgname-$_pkglibver.tar.gz" \
		-DCMAKE_BUILD_WITH_INSTALL_RPATH=TRUE \
		-DCMAKE_INSTALL_RPATH="/opt/$pkgname"
	make LOOT
}

package() {
	_builddir="$srcdir/$pkgname-$pkgver/build"

	install -Dm755 -t "${pkgdir}/opt/${pkgname}" \
		"$_builddir/LOOT" \
		"$_builddir/libloot.so"

	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/LOOT" "${pkgdir}/usr/bin"
	ln -s "libloot.so" "${pkgdir}/opt/${pkgname}/libloot.so.0"

	# Install the icon
	install -Dm644 "${_builddir}/../resources/icons/loot.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/loot.svg"
	# Install desktop entry
	install -Dm644 "${srcdir}/LOOT.desktop" "${pkgdir}/usr/share/applications/LOOT.desktop"
}
