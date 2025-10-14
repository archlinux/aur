# Maintainer: Oliver Weissbarth <mail@oweissbarth.de>
# Maintainer: SFN
pkgname=tl-render
pkgver=0.10.0
pkgrel=2
pkgdesc="tlRender is an open source library for building playback and review applications for visual effects, film, and animation."
arch=("x86_64")
url="https://github.com/darbyjohnston/tlRender"
license=('BSD-3-Clause')
groups=()
depends=('feather-tk' 'minizip-ng' 'opentimelineio' 'opencolorio' 'openexr' 'ffmpeg' 'libpng' 'libtiff' 'libjpeg-turbo' 'sdl2')
makedepends=('cmake' 'make')
replaces=()
backup=()
options=()
source=("tlRender-${pkgver}.tar.gz::https://github.com/darbyjohnston/tlRender/archive/refs/tags/${pkgver}.tar.gz"
		"0001-minizip-ng.patch" "zlibng-config.cmake" "dynamic-libjpeg-turbo-and-sdl2.patch")
noextract=()
sha256sums=('7bf07511c699b868607a3ac7fc07aa1347bda15dedd8cfb1a96761debee6f880'
            'c22d9bf779d8298af6c89c86c63c07308232c6c28ad81458ad63a92c00728e6b'
            '72d993ec6dceff21552f22c25aff2bc8ceea4cb7315029e0ab6bf7878af9ec21'
            'b1fb3d32c55639463946a10e0af7b13e1e036224712252dea8ace09575a4fc49')

CFLAGS+=" -ffat-lto-objects" # lto problems with static libs
CXXFLAGS+=" -ffat-lto-objects" # lto problems with static libs

build() {
	cd "$srcdir/tlRender-${pkgver}"
  rm -fr build
  patch -p1 < "$srcdir/0001-minizip-ng.patch"
  patch -p1 < "$srcdir/dynamic-libjpeg-turbo-and-sdl2.patch"

  #Fix missing include
  sed 's|\(tlTimeline tlIO\)|\1 MINIZIP::minizip-ng|g' -i lib/tlTimeline/CMakeLists.txt

  #Fix minizip in cmake package
  sed 's|minizip|minizip-ng|g' -i tlRenderConfig.cmake.in
  
  #Fix a bug with new mz version
  sed 's|mz_zip_writer_create(&_writer)|_writer = mz_zip_writer_create()|g' -i lib/tlTimeline/Util.cpp
  sed 's|mz_zip_reader_create(&reader)|reader = mz_zip_reader_create()|g' -i lib/tlTimeline/TimelineCreate.cpp

  #Fix ffmpeg bug
  sed 's|avcodec_close(|avcodec_free_context(\&|g' -i lib/tlIO/FFmpegReadVideo.cpp
  sed 's|avcodec_close(|avcodec_free_context(\&|g' -i lib/tlIO/FFmpegReadAudio.cpp
  sed 's|FF_PROFILE_UNKNOWN|AV_PROFILE_UNKNOWN|g' -i lib/tlIO/FFmpegWrite.cpp
  
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DTLRENDER_PROGRAMS=Off -DTLRENDER_EXAMPLES=Off -DTLRENDER_TESTS=Off -DCMAKE_PREFIX_PATH="$srcdir;$CMAKE_PREFIX_PATH" -B build .
  cmake --build build --parallel
}

package() {
	cd "$srcdir/tlRender-${pkgver}/build"
	make DESTDIR="$pkgdir/" install
	mkdir -p ${pkgdir}/usr/share/licenses/tl-render
	mv ${pkgdir}/usr/etc/tlRender ${pkgdir}/usr/share/licenses/tl-render
}
