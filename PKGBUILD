# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_pkgname=soundtouch
pkgname=lib32-$_pkgname
pkgver=2.4.0
pkgrel=1
pkgdesc='An open-source audio processing library for changing the tempo, pitch and playback rates of audio streams or audio files (32 bit)'
arch=('x86_64')
url='https://www.surina.net/soundtouch'
license=('LGPL-2.1-or-later')
depends=('lib32-gcc-libs' $_pkgname)
makedepends=('cmake' 'git' 'ninja')
source=("git+https://codeberg.org/$_pkgname/$_pkgname.git#tag=${pkgver}")
sha256sums=('6ea20477dfd6ccf38abb9d917213315d0be2ad21eac1905f22069724c277ec17')

prepare() {
	cd "${_pkgname}"

	sed -i '/target_compile_options(SoundTouch PRIVATE ${COMPILE_OPTIONS})/d' 'CMakeLists.txt'
}

build() {
	cmake -S "${_pkgname}" -B build -G Ninja \
		-DCMAKE_BUILD_TYPE='Release' \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_SHARED_LIBS=ON \
		-DCMAKE_CXX_FLAGS_RELEASE='-m32 -DNDEBUG' \
		-DCMAKE_INSTALL_LIBDIR=lib32 \
		-DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
		-DSOUNDSTRETCH=OFF
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
	rm -rf "${pkgdir}"/usr/{bin,doc,include,share}
}
