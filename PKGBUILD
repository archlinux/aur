# Maintainer: Oliver Weissbarth <mail@oweissbarth.de>
# Maintainer: SFN
pkgname=tl-render
pkgver=0.13.0
pkgrel=2
pkgdesc="tlRender is an open source library for building playback and review applications for visual effects, film, and animation."
arch=("x86_64")
url="https://github.com/darbyjohnston/tlRender"
license=('BSD-3-Clause')
groups=()
depends=('feather-tk' 'minizip-ng' 'opentimelineio' 'opencolorio' 'openimageio' 'openexr' 'ffmpeg' 'libpng' 'libtiff' 'libjpeg-turbo' 'sdl2')
makedepends=('cmake' 'make')
replaces=()
backup=()
options=()
source=("tlRender-${pkgver}.tar.gz::https://github.com/darbyjohnston/tlRender/archive/refs/tags/${pkgver}.tar.gz" "zlibng-config.cmake")
noextract=()
sha256sums=('93d0d44d46ad91e842b70030d03f08ef3c98e83022f3047fbb78d92f950b8c8f'
            '72d993ec6dceff21552f22c25aff2bc8ceea4cb7315029e0ab6bf7878af9ec21')

CFLAGS+=" -ffat-lto-objects" # lto problems with static libs
CXXFLAGS+=" -ffat-lto-objects" # lto problems with static libs

build() {
	cd "$srcdir/tlRender-${pkgver}"
  rm -fr build

  # Link against dynamic sdl2
  sed 's|SDL2::SDL2-static|SDL2::SDL2|g' -i lib/tlCore/CMakeLists.txt

  # Link against dynamic libjpeg-turbo
  sed 's|libjpeg-turbo::turbojpeg-static|libjpeg-turbo::turbojpeg|g' -i lib/tlIO/CMakeLists.txt

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DTLRENDER_PROGRAMS=Off -DTLRENDER_EXAMPLES=Off -DTLRENDER_TESTS=Off -DCMAKE_PREFIX_PATH="$srcdir;$CMAKE_PREFIX_PATH" -B build .
  cmake --build build --parallel
}

package() {
	cd "$srcdir/tlRender-${pkgver}/build"
	make DESTDIR="$pkgdir/" install
	mkdir -p ${pkgdir}/usr/share/licenses/tl-render
	mv ${pkgdir}/usr/etc/tlRender ${pkgdir}/usr/share/licenses/tl-render
}
