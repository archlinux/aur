# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Brett Cornwall <ainola@archlinux.org>
# Contributor: Ner0
# Contributor: quantax
# Contributor: xyproto

pkgname=ags
pkgver=3.6.0.48
pkgrel=1
pkgdesc='Engine to run adventure/quest games'
arch=('x86_64')
url='https://github.com/adventuregamestudio/ags'
license=('Artistic2.0')
# ags depends on Allegro 4 and do not have plans to upgrade - they intend to replace Allegro entirely with SDL.
# https://github.com/adventuregamestudio/ags/issues/403
# https://github.com/adventuregamestudio/ags/issues/762
# https://github.com/adventuregamestudio/ags/issues/1051#issuecomment-602217650
depends=('dumb-a4' 'libtheora' 'sdl2' 'libvorbis')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/adventuregamestudio/ags/archive/v.$pkgver.tar.gz")
sha256sums=('1e07196a3a5812946994e90ff15d7d593f528042875471e806061131c8b4d5ab')

_srcdir="$pkgname-v.$pkgver"

build() {
	cmake -S "$_srcdir" -B 'build' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DCMAKE_BUILD_TYPE='Release' \
		-DCMAKE_C_FLAGS_RELEASE='-DNDEBUG -w' \
		-DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG -w' \
		-DAGS_USE_LOCAL_ALL_LIBRARIES=ON \
		-DAGS_USE_LOCAL_SDL2_SOUND=OFF \
		-DAGS_BUILD_TOOLS=OFF
	cmake --build 'build'
}

check() {
	cmake -S "$_srcdir" -B 'build' -DAGS_TESTS=ON
	cmake --build 'build'
	cmake --build 'build' --target test
}

package() {
	DESTDIR="${pkgdir}" cmake --install 'build'
	install -Dm644 "${_srcdir}/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
