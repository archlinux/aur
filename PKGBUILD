# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=imagine
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r42.049d5d8
pkgrel=3
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=173633'
license=('GPL')
depends=(
  'vapoursynth'
  'libpng'
  'libtiff' 'libtiff.so'
  'openjpeg2'
  'ffmpeg' 'libavcodec.so' 'libavformat.so' 'libavutil.so' 'libswscale.so'
  'openexr'
)
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=(
  "${_plug}::git+https://github.com/sekrit-twc/imagine.git"
  'git+https://github.com/sekrit-twc/libp2p.git'
  'git+https://github.com/sekrit-twc/vsxx.git'
  'path_lin.cpp'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  '7d8f08965f636c9ed7321fe1c6d3b66d63fdbdac0e3cb6ccc54392ae700df4ee'
)
options=('debug')

pkgver() {
  cd "${_plug}"
  #echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  cd "${_plug}"
  git config submodule.extra/libp2p.url "${srcdir}/libp2p"
  git config submodule.extra/vsxx.url "${srcdir}/vsxx"
  git -c protocol.file.allow=always submodule update --init \
    extra/libp2p \
    extra/vsxx

  (cd extra/vsxx; git pull origin master)

  rm -fr extra/vsxx/vapoursynth

  sed -e 's|"VapourSynth4.h"|<VapourSynth4.h>|g' \
      -e 's|"VSHelper4.h"|<VSHelper4.h>|g' \
      -i extra/vsxx/VapourSynth4++.hpp
  sed -e 's|"VapourSynth.h"|<VapourSynth.h>|g' \
      -e 's|"VSHelper.h"|<VSHelper.h>|g' \
      -i extra/vsxx/VapourSynth++.hpp
#   sed -e 's|VapourSynth++.hpp|VapourSynth4++.hpp|g' \
#       -e 's|vsxx_pluginmain.h|vsxx4_pluginmain.h|g' \
#       -i src/vsimagine/vsimagine.cpp

  # silence deprecation warnings
  sed -e 's|uint8 |uint8_t |g' \
      -e 's|uint8>|uint8_t>|g' \
      -e 's|uint16 |uint16_t |g' \
      -e 's|uint32 |uint32_t |g' \
      -i src/imagine/provider/tiff_decoder.cpp

  cp "${srcdir}/path_lin.cpp" src/vsimagine/path_lin.cpp

  echo "all:
	  g++ -c -std=c++14 -DP2P_USER_NAMESPACE=im_p2p -I./extra/libp2p ${CXXFLAGS} ${CPPFLAGS} -fPIC  -o extra/libp2p/v210.o extra/libp2p/v210.cpp

	  g++ -c -std=c++14 -I./src/imagine ${CXXFLAGS} ${CPPFLAGS} -fPIC -o src/imagine/api/imagine.o src/imagine/api/imagine.cpp

	  g++ -c -std=c++14 -I./src/imagine ${CXXFLAGS} ${CPPFLAGS} -fPIC -o src/imagine/common/decoder.o src/imagine/common/decoder.cpp
	  g++ -c -std=c++14 -I./src/imagine ${CXXFLAGS} ${CPPFLAGS} -fPIC -o src/imagine/common/file_io.o src/imagine/common/file_io.cpp
	  g++ -c -std=c++14 -I./src/imagine ${CXXFLAGS} ${CPPFLAGS} -fPIC -o src/imagine/common/io_context.o src/imagine/common/io_context.cpp
	  g++ -c -std=c++14 -I./src/imagine ${CXXFLAGS} ${CPPFLAGS} -fPIC -o src/imagine/common/jumpman.o src/imagine/common/jumpman.cpp
	  g++ -c -std=c++14 -I./src/imagine ${CXXFLAGS} ${CPPFLAGS} -fPIC -o src/imagine/common/memory_io.o src/imagine/common/memory_io.cpp
	  g++ -c -std=c++14 -I./src/imagine ${CXXFLAGS} ${CPPFLAGS} -fPIC -o src/imagine/common/path.o src/imagine/common/path.cpp

	  g++ -c -std=c++14 -DP2P_USER_NAMESPACE=im_p2p -I./src/imagine -I./extra ${CXXFLAGS} ${CPPFLAGS} -fPIC -o src/imagine/provider/bmp_decoder.o src/imagine/provider/bmp_decoder.cpp
	  g++ -c -std=c++14 -I./src/imagine -I./extra ${CXXFLAGS} ${CPPFLAGS} -fPIC -o src/imagine/provider/jpeg_decoder.o src/imagine/provider/jpeg_decoder.cpp
	  g++ -c -std=c++14 -DP2P_USER_NAMESPACE=im_p2p -I./src/imagine -I./extra ${CXXFLAGS} ${CPPFLAGS} -fPIC -o src/imagine/provider/png_decoder.o src/imagine/provider/png_decoder.cpp
	  g++ -c -std=c++14 -I./src/imagine -I./extra ${CXXFLAGS} ${CPPFLAGS} -fPIC -o src/imagine/provider/tiff_decoder.o src/imagine/provider/tiff_decoder.cpp

	  ar rcs libimagine.a extra/libp2p/*.o src/imagine/api/*.o src/imagine/common/*.o src/imagine/provider/*.o

	  g++ -c -std=c++14 -I./src/vsimagine -I./extra/vsxx $(pkg-config --cflags vapoursynth) ${CXXFLAGS} ${CPPFLAGS} -fPIC -o extra/vsxx/vsxx_pluginmain.o extra/vsxx/vsxx_pluginmain.cpp

	  g++ -c -std=c++14 -I./src/vsimagine -I./extra ${CXXFLAGS} ${CPPFLAGS} -fPIC -o src/vsimagine/vspath.o src/vsimagine/path_lin.cpp
	  g++ -c -std=c++14 -I./src/vsimagine -I./src/imagine/api -I./extra $(pkg-config --cflags vapoursynth) ${CXXFLAGS} ${CPPFLAGS} -include extra/vsxx/VapourSynth++.hpp -fPIC -o src/vsimagine/vsimagine.o src/vsimagine/vsimagine.cpp

	  g++ -std=c++14 -shared -o libvs${_plug}.so extra/libp2p/*.o src/imagine/api/*.o src/imagine/common/*.o src/imagine/provider/*.o extra/vsxx/*.o src/vsimagine/*.o $(pkg-config --libs OpenEXR libavcodec libavformat libavutil libswscale libjpeg libopenjp2 libtiff-4 libpng liblzma zlib vapoursynth) ${CXXFLAGS} ${CPPFLAGS} ${LDFLAGS},--no-undefined"> Makefile
}

build() {
  make -C "${_plug}"
}

package() {
  install -Dm755 "${_plug}/libvs${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/libvs${_plug}.so"
}
