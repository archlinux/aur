# Maintainer: Oliver Weissbarth <mail@oweissbarth.de>
# Maintainer: SFN
pkgname=tl-render
pkgver=0.25.0
pkgrel=1
pkgdesc="tlRender is an open source library for building playback and review applications for visual effects, film, and animation."
arch=("x86_64")
url="https://github.com/grizzlypeak3d/tlRender"
license=('BSD-3-Clause')
groups=()
depends=('feather-tk' 'minizip-ng' 'opentimelineio' 'opencolorio' 'openimageio' 'openexr' 'ffmpeg' 'libpng' 'libtiff' 'libjpeg-turbo' 'sdl2' 'subprocessh-git' 'fmt')
makedepends=('cmake' 'make')
replaces=()
backup=()
options=()
source=("tlRender-${pkgver}.tar.gz::https://github.com/grizzlypeak3d/tlRender/archive/refs/tags/${pkgver}.tar.gz" "0001-Export-ffmpeg-targets-correctly.patch")
noextract=()
sha256sums=('16cff8a740e9f85b1d512c61f2478214753cd953f37a6183202fc15ea1da4240'
            '3d0fca023f893555f19d21367055541e2024371a950a12480dda0894c3b6a7e1')

CFLAGS+=" -ffat-lto-objects" # lto problems with static libs
CXXFLAGS+=" -ffat-lto-objects" # lto problems with static libs

build() {
	cd "$srcdir/tlRender-${pkgver}"
  rm -fr build

  patch -p1 < "$srcdir/0001-Export-ffmpeg-targets-correctly.patch"
  
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DTLRENDER_PROGRAMS=Off -DTLRENDER_EXAMPLES=Off -DTLRENDER_TESTS=Off -DTLRENDER_FTK_PACKAGE=On -B build .
  cmake --build build --parallel
}

package() {
	cd "$srcdir/tlRender-${pkgver}/build"
	make DESTDIR="$pkgdir/" install
	mkdir -p ${pkgdir}/usr/share/licenses/tl-render
  mv ${pkgdir}/usr/share/tlRender/Legal/LICENSE_*.txt ${pkgdir}/usr/share/licenses/tl-render
}
