# Maintainer: Oliver Weissbarth <mail@oweissbarth.de>
# Maintainer: SFN
pkgname=feather-tk
pkgver=0.5.0
pkgrel=1
pkgdesc="A lightweight toolkit for building cross-platform applications"
arch=("x86_64")
url="https://github.com/darbyjohnston/feather-tk"
license=('BSD-3-Clause')
groups=()
depends=('lunasvg' 'nlohmann-json' 'libpng' 'freetype2' 'libglvnd' 'sdl2')
makedepends=('cmake' 'make')
replaces=()
backup=()
options=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/darbyjohnston/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
noextract=()
sha256sums=('44f01bf927bcb8e1e5b141a9caa5da6aab87376979a15494479cad93bc3f0d36')

CFLAGS+=" -ffat-lto-objects" #lto problems with static libs
CXXFLAGS+=" -ffat-lto-objects" #lto problems with static libs

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  # Link against shared SDL2 library instead of static one
  sed 's|SDL2::SDL2-static|SDL2::SDL2|' -i lib/ftk/GL/CMakeLists.txt
  rm -fr build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -Dftk_TESTS=OFF -Dftk_EXAMPLES=OFF -DCMAKE_BUILD_TYPE=Release -B build .
  cmake --build build --parallel
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}/build"
	make DESTDIR="$pkgdir/" install

	mkdir -p ${pkgdir}/usr/share/licenses/ftk/
	mv ${pkgdir}/usr/share/ftk/LICENSE.txt ${pkgdir}/usr/share/licenses/ftk/
}
