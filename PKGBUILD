# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Brett Cornwall <ainola@archlinux.org>
# Contributor: Ner0
# Contributor: quantax
# Contributor: xyproto

pkgname=ags
pkgver=3.6.2.14
pkgrel=1
pkgdesc='Engine to run adventure/quest games'
arch=('x86_64')
url='https://github.com/adventuregamestudio/ags'
license=('Artistic-2.0')
depends=('sdl2' 'sdl2_sound' 'libogg' 'libtheora' 'libvorbis' 'freetype2' 'glm' 'tinyxml2' 'miniz')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/adventuregamestudio/ags/archive/v$pkgver.tar.gz")
sha256sums=('76489b19f0d2bdda88bcf9fe88c9586f4ebe3345fd596cd60bc2318ae0d0d827')

_srcdir="$pkgname-$pkgver"

prepare() {
	cd "$_srcdir"

	sed -i '/include_directories("${SDL_sound_INCLUDE_DIRS}")/d' 'CMakeLists.txt'
	sed -i 's/find_package(SDL_sound REQUIRED)/find_package(SDL2_sound REQUIRED)/' 'CMakeLists.txt'
	sed -i 's|add_subdirectory(Common/libsrc/freetype-2.1.3   EXCLUDE_FROM_ALL)|find_package(Freetype REQUIRED)|' 'CMakeLists.txt'
	sed -i 's|set(FREETYPE_LIBRARIES FreeType::FreeType)|set(FREETYPE_LIBRARIES Freetype::Freetype)|' 'CMakeLists.txt'

	sed -i '/<string.h>/a #include <strings.h>|' 'Common/util/string_compat.c'
}

build() {
	cmake -S "$_srcdir" -B 'build' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DCMAKE_BUILD_TYPE=None \
		-DAGS_USE_LOCAL_ALL_LIBRARIES=ON \
		-DAGS_BUILD_TOOLS=ON \
		-DCMAKE_POLICY_VERSION_MINIMUM=3.5
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
