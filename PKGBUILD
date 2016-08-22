# Maintainer: Alexandre Iooss <alexandre.iooss@gmail.com>

pkgname=libarmedia-git
pkgver=r185.ecf0999
pkgrel=2
pkgdesc="ARSDK Video encapsulation"
arch=(x86_64)
url="http://developer.parrot.com/"
license=('custom')
groups=()
depends=(libarsal-git libardiscovery-git json-c)
optdepends=()
makedepends=(git)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('libarmedia::git+https://github.com/Parrot-Developers/libARMedia'
        'libarmedia-Makefile'
        '0001-Fix-json-c.patch'
        'Config-linux-config.h'
        'LICENSE')
sha256sums=('SKIP'
            '48c7d1de6ba25df56be94814ccdfd2a3f1542f151327461395fbc79d1f3f971c'
            '42aed9b67dadfde3eeb27d20d88fc9865eca6d66cef5fa3697cfcfeaa980ebd6'
            '5956b54ef47ad26df51991a4aa7002abdcb524a51b455d040f55b4d11a4f44a7'
            '1771e95329e9cb2bed04e023e330af3d558d0f13c0c1c5de0581f2880f149deb')

pkgver() {
	cd "$srcdir/libarmedia"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cp "$srcdir/libarmedia-Makefile" "$srcdir/libarmedia/Makefile"
	cp "$srcdir/Config-linux-config.h" "$srcdir/libarmedia/Includes/config.h"

	patch -p1 -i "$srcdir/0001-Fix-json-c.patch"
}

build() {
	cd "$srcdir/libarmedia"
	make
}

package() {
	# Install headers
	mkdir -p "$pkgdir/usr/include/libARMedia"
	cp "$srcdir/libarmedia/Includes/libARMedia/ARMEDIA_VideoAtoms.h" "$pkgdir/usr/include/libARMedia/"
	cp "$srcdir/libarmedia/Includes/libARMedia/ARMEDIA_Error.h" "$pkgdir/usr/include/libARMedia/"
	cp "$srcdir/libarmedia/Includes/libARMedia/ARMEDIA_VideoEncapsuler.h" "$pkgdir/usr/include/libARMedia/"
	cp "$srcdir/libarmedia/Includes/libARMedia/ARMedia.h" "$pkgdir/usr/include/libARMedia/"

	# Install lib
	mkdir -p "$pkgdir/usr/lib"
	cp "$srcdir/libarmedia/libarmedia.so" "$pkgdir/usr/lib/"

	# Install license
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	cp "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
