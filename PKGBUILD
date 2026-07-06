# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: silverhikari <kerrickethan@gmail.com>
# Contributor: Flat <flat@imo.uto.moe>
pkgname=imgbrd-grabber-git
pkgver=7.12.2.r239.g3495e082
pkgrel=1
epoch=1
pkgdesc="Very customizable imageboard/booru downloader with powerful filenaming features."
arch=('i686' 'x86_64')
url="https://github.com/Bionus/imgbrd-grabber"
license=('Apache-2.0')
depends=('qt6-multimedia' 'qt6-declarative' 'nodejs' 'qt6-networkauth' 'hicolor-icon-theme'
	 'qt6-base' 'libstdc++' 'glibc' 'libgcc')
makedepends=('git' 'cmake' 'qt6-tools' 'npm' 'jq' 'qt6-shadertools' 'qt6-webengine' 'ninja')
optdepends=('openssl: used for HTTPS sources')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Bionus/imgbrd-grabber.git#branch=develop'
	'git+https://github.com/catchorg/Catch2.git'
	'git+https://github.com/sakra/cotire.git'
	'git+https://github.com/LaurentGomila/qt-android-cmake.git'
	'git+https://github.com/lexbor/lexbor.git')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')


pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git submodule init
	git config submodule.tests/src/vendor/catch.url "$srcdir/Catch2"
	git config submodule.cmake/qt-android-cmake.url "$srcdir/qt-android-cmake"
	git config submodule.cmake/cotire.url "$srcdir/cotire"
	git config submodule.lib/vendor/lexbor.url "$srcdir/lexbor"
	git -c protocol.file.allow=always submodule update
}

build() {
	cmake -B build -GNinja -S "${pkgname%-git}/src" \
	-DCMAKE_BUILD_TYPE='None' \
	-DCMAKE_C_FLAGS="$CFLAGS -DNDEBUG" \
	-DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG" \
	-DCMAKE_INSTALL_PREFIX='/usr' \
	-DUSE_QSCINTILLA=0 \
	-DUSE_BREAKPAD=0 \
	-DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
	-Wno-dev

	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
