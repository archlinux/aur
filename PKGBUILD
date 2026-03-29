# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_pkgname=soundtouch
pkgname=lib32-$_pkgname
pkgver=2.4.1
pkgrel=1
pkgdesc='An open-source audio processing library for changing the tempo, pitch and playback rates of audio streams or audio files (32 bit)'
arch=('x86_64')
url='https://www.surina.net/soundtouch'
license=('LGPL-2.1-or-later')
depends=('lib32-gcc-libs' $_pkgname)
makedepends=('cmake' 'git' 'ninja')
source=("${_pkgname}-${pkgver}.tar.gz::https://codeberg.org/soundtouch/soundtouch/archive/${pkgver}.tar.gz")
sha256sums=('e07abf20ce8f95850c280132e1f61ad400fc1f4011b7fac698a503de6aab6733')

_srcdir="${_pkgname}"

prepare() {
	cd "${_srcdir}"

	sed -i '/target_compile_options(SoundTouch PRIVATE ${COMPILE_OPTIONS})/d' 'CMakeLists.txt'
}

build() {
	cmake -S "${_srcdir}" -B build -G Ninja \
		-DCMAKE_BUILD_TYPE='Release' \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_SHARED_LIBS=ON \
		-DCMAKE_CXX_FLAGS_RELEASE='-m32 -DNDEBUG' \
		-DCMAKE_INSTALL_LIBDIR=lib32 \
		-DSOUNDSTRETCH=OFF
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
	rm -rf "${pkgdir}"/usr/{bin,doc,include,share}
}
