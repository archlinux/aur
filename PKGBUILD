# Maintainer: Oliver Weissbarth <mail@oweissbarth.de>
# Maintainer: SFN
pkgname=feather-tk
pkgver=0.4.0
pkgrel=2
pkgdesc="A lightweight toolkit for building cross-platform applications"
arch=("x86_64")
url="https://github.com/darbyjohnston/feather-tk"
license=('BSD-3-Clause')
groups=()
depends=('lunasvg' 'nlohmann-json' 'libpng' 'freetype2' 'libglvnd' 'glfw')
makedepends=('cmake' 'make')
replaces=()
backup=()
options=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/darbyjohnston/${pkgname}/archive/refs/tags/${pkgver}.tar.gz" "glad-lib-prefix.patch")
noextract=()
sha256sums=('4cd8645028deaec03959569db757525b43753eb1bdae4adb71107b58ca4cbb03'
            '557cf3344789c551953005d6d69e81d2682933a517f4797b2c332e0997e7c594')

CFLAGS+=" -ffat-lto-objects" #lto problems with static libs
CXXFLAGS+=" -ffat-lto-objects" #lto problems with static libs

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  rm -fr build
  patch -p1 < "$srcdir/glad-lib-prefix.patch"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -Dfeather_tk_TESTS=OFF -Dfeather_tk_EXAMPLES=OFF -DCMAKE_BUILD_TYPE=Release -B build .
  cmake --build build --parallel
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}/build"
	make DESTDIR="$pkgdir/" install

	mkdir -p ${pkgdir}/usr/share/licenses/feather-tk/
	mv ${pkgdir}/usr/share/feather-tk/LICENSE.txt ${pkgdir}/usr/share/licenses/feather-tk/
}
