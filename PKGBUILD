# Maintainer: Alexandre Iooss <alexandre.iooss@gmail.com>

## READ THIS !!!
# Because the parrot mavlink message definition include a "common" message defenition,
# you need to apply PARROT-DEV-if-include-xml-files-does-not-exist-in-same-dire.patch
# (in this pkg directory) to "python2-pymavlink-git".
# This problem should be fixed soon: I'm trying to send the patch upstream.

pkgname=libarmavlink-git
pkgver=r65.c462be4
pkgrel=2
pkgdesc="ARSDK MAVLink file manager"
arch=(x86_64)
url="http://developer.parrot.com/"
license=('custom')
groups=()
depends=(libarsal-git)
optdepends=()
makedepends=(git python2-pymavlink-git)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('libarmavlink::git+https://github.com/Parrot-Developers/libARMavlink'
        'libarmavlink-Makefile'
        'Config-linux-config.h'
        'LICENSE')
sha256sums=('SKIP'
            '890ca6aed8ab5c1e8da1791d446f565d634f49549d432f92e5afdf9726c75599'
            '5956b54ef47ad26df51991a4aa7002abdcb524a51b455d040f55b4d11a4f44a7'
            '1771e95329e9cb2bed04e023e330af3d558d0f13c0c1c5de0581f2880f149deb')

pkgver() {
	cd "$srcdir/libarmavlink"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cp "$srcdir/libarmavlink-Makefile" "$srcdir/libarmavlink/Makefile"
	cp "$srcdir/Config-linux-config.h" "$srcdir/libarmavlink/Includes/config.h"
}

build() {
	cd "$srcdir/libarmavlink"
	mavgen.py --lang C -o generated/mavlink/ message_definitions/parrot.xml
	make
}

package() {
	# Install headers
	mkdir -p "$pkgdir/usr/include/libARMavlink"
	cp "$srcdir/libarmavlink/Includes/libARMavlink/libARMavlink.h" "$pkgdir/usr/include/libARMavlink/"
	cp "$srcdir/libarmavlink/Includes/libARMavlink/ARMAVLINK_Error.h" "$pkgdir/usr/include/libARMavlink/"
	cp "$srcdir/libarmavlink/Includes/libARMavlink/ARMAVLINK_FileGenerator.h" "$pkgdir/usr/include/libARMavlink/"
	cp "$srcdir/libarmavlink/Includes/libARMavlink/ARMAVLINK_FileParser.h" "$pkgdir/usr/include/libARMavlink/"
	cp "$srcdir/libarmavlink/Includes/libARMavlink/ARMAVLINK_ListUtils.h" "$pkgdir/usr/include/libARMavlink/"
	cp "$srcdir/libarmavlink/Includes/libARMavlink/ARMAVLINK_Manager.h" "$pkgdir/usr/include/libARMavlink/"
	cp "$srcdir/libarmavlink/Includes/libARMavlink/ARMAVLINK_MissionItemUtils.h" "$pkgdir/usr/include/libARMavlink/"

	# Install generated mavlink headers
	cp -r "$srcdir/libarmavlink/generated/mavlink" "$pkgdir/usr/include/mavlink/"

	# Install lib
	mkdir -p "$pkgdir/usr/lib"
	cp "$srcdir/libarmavlink/libarmavlink.so" "$pkgdir/usr/lib/"

	# Install license
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	cp "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
