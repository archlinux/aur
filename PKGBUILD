# Maintainer: Raffaele Mancuso <raffaelemancuso532 at gmail dot com>
pkgname=pdf4qt-git
pkgver=1.3.6.r7.gc01a1da
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
optdepends=(
	'flite: Text-To-Speech using flite synthesizer',
	'libspeechd: Text-To-Speech using speechd synthesizer'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname"::'git+https://github.com/JakubMelka/PDF4QT'
	'CMakeListsMain.patch'
	'CMakeListsLib.patch'
	'FindLCMS2.cmake')
sha256sums=('SKIP'
	'07f8f1b3e89fbc33079235c17c9498181fdcb1916e44b7421925401a7cdca92c'
	'7a54e7db1d2f2e246c9e9b66a2c41e992a2356976c0a70db876e4be9cc57cc5d'
	'fb438faf87211cf3c21c6fa624cedd2ec6af49b03827e1ad230e0202e939a8ec')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --tags --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$pkgname"
	patch -p1 -i "$srcdir/CMakeListsMain.patch"
	patch -p1 -i "$srcdir/CMakeListsLib.patch"
}

build() {
	cmake -B build -S "$pkgname" \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-Wno-dev \
		-DCMAKE_MODULE_PATH="$srcdir" \
		-DPDF4QT_INSTALL_DEPENDENCIES=0
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
