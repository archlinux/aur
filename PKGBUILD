# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Brett Cornwall <ainola@archlinux.org>
# Contributor: Ner0
# Contributor: quantax
# Contributor: xyproto

pkgname=ags
pkgver=3.6.2.21
pkgrel=1
pkgdesc='Engine to run adventure/quest games'
arch=('x86_64')
url='https://github.com/adventuregamestudio/ags'
license=('Artistic-2.0')
depends=('sdl2' 'sdl2_sound' 'libogg' 'libtheora' 'libvorbis' 'freetype2' 'glm' 'tinyxml2' 'miniz')
makedepends=('cmake' 'gtest')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
sha256sums=('19cc4bdf222c5bf1c412d11f19f3fee07b310e21a9b731f42f1f71d6faf0e1a0')

_srcdir="$pkgname-$pkgver"

prepare() {
	cd "$_srcdir"

	sed -i '/include_directories("${SDL_sound_INCLUDE_DIRS}")/d' 'CMakeLists.txt'
	sed -i 's/find_package(SDL_sound REQUIRED)/find_package(SDL2_sound REQUIRED)/' 'CMakeLists.txt'
	sed -i 's|add_subdirectory(Common/libsrc/freetype-2.1.3   EXCLUDE_FROM_ALL)|find_package(Freetype REQUIRED)|' 'CMakeLists.txt'
	sed -i 's|set(FREETYPE_LIBRARIES FreeType::FreeType)|set(FREETYPE_LIBRARIES Freetype::Freetype)|' 'CMakeLists.txt'

	sed -i '/<string.h>/a #include <strings.h>/' 'Common/util/string_compat.c'

	find . -name 'CMakeLists.txt' -exec sed -i 's/CXX_STANDARD 11/CXX_STANDARD 23/' {} \;
}

build() {
	cmake -S "$_srcdir" -B 'build' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DCMAKE_BUILD_TYPE=None \
		-DAGS_TESTS=ON \
		-DCMAKE_CXX_STANDARD=23 \
		-DAGS_USE_LOCAL_ALL_LIBRARIES=ON \
		-DAGS_BUILD_TOOLS=ON \
		-DCMAKE_POLICY_VERSION_MINIMUM=3.5
	cmake --build 'build'
}

check() {
	cmake --build 'build' --target test
}

package() {
	DESTDIR="${pkgdir}" cmake --install 'build'
	install -Dm644 "${_srcdir}/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
