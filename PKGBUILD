# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Brett Cornwall <ainola@archlinux.org>
# Contributor: Ner0
# Contributor: quantax
# Contributor: xyproto

pkgname=ags
pkgver=3.6.0.48
pkgrel=2
pkgdesc='Engine to run adventure/quest games'
arch=('x86_64')
url='https://github.com/adventuregamestudio/ags'
license=('Artistic2.0')
# ags depends on Allegro 4 and do not have plans to upgrade - they intend to replace Allegro entirely with SDL.
# https://github.com/adventuregamestudio/ags/issues/403
# https://github.com/adventuregamestudio/ags/issues/762
# https://github.com/adventuregamestudio/ags/issues/1051#issuecomment-602217650
depends=('sdl2' 'sdl2_sound' 'libogg' 'libtheora' 'libvorbis' 'freetype2')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/adventuregamestudio/ags/archive/v.$pkgver.tar.gz")
sha256sums=('1e07196a3a5812946994e90ff15d7d593f528042875471e806061131c8b4d5ab')

_srcdir="$pkgname-v.$pkgver"

prepare() {
	cd "$_srcdir"
	
	sed -i '/include_directories("${SDL_sound_INCLUDE_DIRS}")/d' 'CMakeLists.txt'
	sed -i 's/find_package(SDL_sound REQUIRED)/find_package(SDL2_sound REQUIRED)/' 'CMakeLists.txt'
	#cp -f "${srcdir}/FindLocalAllegro.cmake" 'CMake'
	
	sed -i 's|add_subdirectory(Common/libsrc/freetype-2.1.3   EXCLUDE_FROM_ALL)|find_package(Freetype REQUIRED)|' 'CMakeLists.txt'
	sed -i 's|set(FREETYPE_LIBRARIES FreeType::FreeType)|set(FREETYPE_LIBRARIES Freetype::Freetype)|' 'CMakeLists.txt'
}

build() {
	cmake -S "$_srcdir" -B 'build' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DCMAKE_BUILD_TYPE='Release' \
		-DCMAKE_C_FLAGS_RELEASE='-DNDEBUG -w' \
		-DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG -w' \
		-DAGS_USE_LOCAL_ALL_LIBRARIES=ON \
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
