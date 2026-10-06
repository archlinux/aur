# Maintainer: Oliver Weissbarth <mail@oweissbarth.de>
# Maintainer: SFN
pkgname=feather-tk
pkgver=0.16.3
pkgrel=1
pkgdesc="A lightweight toolkit for building cross-platform applications"
arch=("x86_64")
url="https://github.com/grizzlypeak3d/feather-tk"
license=('BSD-3-Clause')
groups=()
depends=('lunasvg' 'nlohmann-json' 'libpng' 'freetype2' 'libglvnd' 'sdl2')
makedepends=('cmake' 'make')
replaces=()
backup=()
options=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/grizzlypeak3d/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
noextract=()
sha256sums=('7f55b6fb1bd58c7c5ae224125ddc17400d652318d4bb3861fa7a31db685fc29d')

CFLAGS+=" -ffat-lto-objects" #lto problems with static libs
CXXFLAGS+=" -ffat-lto-objects" #lto problems with static libs

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  # Link against shared SDL2 library instead of static one
  sed 's|SDL2::SDL2-static|SDL2::SDL2|' -i lib/ftk/GL/CMakeLists.txt
  sed 's|Window.h)|Window.h|' -i lib/ftk/UI/CMakeLists.txt
  sed 's|set(PRIVATE_HEADERS||' -i lib/ftk/UI/CMakeLists.txt

  rm -fr build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -Dftk_TESTS=OFF -Dftk_EXAMPLES=OFF -DCMAKE_BUILD_TYPE=Release -B build .
  cmake --build build --parallel
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}/build"
	make DESTDIR="$pkgdir/" install

	mkdir -p ${pkgdir}/usr/share/licenses/ftk/
	mv ${pkgdir}/usr/share/ftk/Legal/LICENSE_*.txt ${pkgdir}/usr/share/licenses/ftk/
}
