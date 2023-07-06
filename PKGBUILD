# Maintainer: Raffaele Mancuso <raffaelemancuso532 at gmail dot com>
pkgname=pdf4qt-git
pkgver=r850.ae3c43f
pkgrel=1
pkgdesc="Open source PDF editor"
arch=('x86_64')
url="https://jakubmelka.github.io/"
license=('LGPL3')
depends=('openssl'
	'libjpeg-turbo'
	'qt6-speech'
	'qt6-svg'
	'qt6-base'
	'openjpeg2'
	'onetbb'
	'lcms2'
	'freetype2'
	'zlib'
	'glibc'
	'gcc-libs'
)
makedepends=('git'
	'cmake'
	'qt6-declarative'
	'qt6-multimedia'
)
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
source=("$pkgname"::'git+https://github.com/JakubMelka/PDF4QT'
	'CMakePatch.patch'
	'CMakeDesktopNoDep.patch'
	'FindLCMS2.cmake')
b2sums=('SKIP'
	'be47f2902d2639170b6fc10742b118cd14b263f30d2225aa601820cb33f946d1d9b5f032fd9c0671e1ac4936c072ff4c6dc7f57c7a53f95f1ad59ba5c2b3ff1c'
	'c413589e2ae48dbf137e7156b5378093fe88d0eac7aa935e1390be03dbfbe9f94e0c3bada3d1c76e4300be929274cff47f9866dfb7387629b7f9d15f1f9d3169'
	'd26119741d02bddc6e18234aeb9d437ed866676f126e073f87efa8f19e3eedfbb77d2f571ff0e1c3963fabc86e1db83b7a1864edfdc1ba8f63cdd1e36da1e382')

pkgver() {
	cd "$srcdir/${pkgname%-VCS}"
	git describe --tags --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-VCS}"
	patch -p1 -i "$srcdir/CMakePatch.patch"
	patch -p1 -i "$srcdir/CMakeDesktopNoDep.patch"
}

build() {
    cmake -B build -S "${pkgname%-VCS}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/' \
        -Wno-dev \
		-DCMAKE_MODULE_PATH="$srcdir" \
		-DPDF4QT_INSTALL_DEPENDENCIES=0
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}

