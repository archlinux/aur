# Maintainer: Alexandre Iooss <alexandre.iooss@gmail.com>

pkgname=libarnetworkal-git
pkgver=r192.baf3f07
pkgrel=2
pkgdesc="ARSDK Network Control Library"
arch=(x86_64)
url="http://developer.parrot.com/"
license=('custom')
groups=()
depends=(libarsal-git)
optdepends=()
makedepends=(git)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('libarnetworkal::git+https://github.com/Parrot-Developers/libARNetworkAL'
        '0001-Fix-relative-paths.patch'
        'libarnetworkal-Makefile'
        'Config-linux-config.h'
        'LICENSE')
sha256sums=('SKIP'
            '8599e6ff21ab7a02df5bf64d1f59edbc3a889f05aa3728b2d67b3666db68b599'
            'ac4c27c3db48b755e9f6a458502fc1fac2714122fdfb1d8a911614afa4e1f4ff'
            '5956b54ef47ad26df51991a4aa7002abdcb524a51b455d040f55b4d11a4f44a7'
            '1771e95329e9cb2bed04e023e330af3d558d0f13c0c1c5de0581f2880f149deb')

pkgver() {
	cd "$srcdir/libarnetworkal"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cp "$srcdir/libarnetworkal-Makefile" "$srcdir/libarnetworkal/Makefile"
	cp "$srcdir/Config-linux-config.h" "$srcdir/libarnetworkal/Includes/config.h"
	patch -p1 -i "$srcdir/0001-Fix-relative-paths.patch"
}

build() {
	cd "$srcdir/libarnetworkal"
	make
}

package() {
	# Install headers
	mkdir -p "$pkgdir/usr/include/libARNetworkAL"
	cp "$srcdir/libarnetworkal/Includes/libARNetworkAL/ARNetworkAL.h" "$pkgdir/usr/include/libARNetworkAL/"
	cp "$srcdir/libarnetworkal/Includes/libARNetworkAL/ARNETWORKAL_Error.h" "$pkgdir/usr/include/libARNetworkAL/"
	cp "$srcdir/libarnetworkal/Includes/libARNetworkAL/ARNETWORKAL_Frame.h" "$pkgdir/usr/include/libARNetworkAL/"
	cp "$srcdir/libarnetworkal/Includes/libARNetworkAL/ARNETWORKAL_Manager.h" "$pkgdir/usr/include/libARNetworkAL/"

	# Install lib
	mkdir -p "$pkgdir/usr/lib"
	cp "$srcdir/libarnetworkal/libarnetworkal.so" "$pkgdir/usr/lib/"

	# Install license
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	cp "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
