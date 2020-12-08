# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=imagine
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r41.73be955
pkgrel=2
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=173633'
license=('GPL')
depends=('vapoursynth'
         'libpng'
         'libtiff'
         'openjpeg2'
         'libavcodec.so'
         'libavformat.so'
         'libavutil.so'
         'libswscale.so'
         )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/sekrit-twc/imagine.git"
        'git+https://github.com/sekrit-twc/libp2p.git'
        'git+https://github.com/sekrit-twc/vsxx.git'
        )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            )

pkgver() {
  cd "${_plug}"
  #echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  cd "${_plug}"
  git config submodule.extra/libp2p.url "${srcdir}/libp2p"
  git config submodule.extra/vsxx.url "${srcdir}/vsxx"
  git submodule update --init extra/libp2p extra/vsxx

  rm -fr extra/vsxx/VSHelper.h extra/vsxx/VapourSynth.h

  sed -e 's|"VapourSynth.h"|<VapourSynth.h>|g' \
      -e 's|"VSHelper.h"|<VSHelper.h>|g' \
      -i extra/vsxx/VapourSynth++.hpp

  sed '10i#include <stdio.h>' \
    -i src/imagine/provider/jpeg_decoder.cpp


  echo "all:
	  g++ -c -fPIC ${CXXFLAGS} -std=c++11 -Wno-missing-field-initializers ${CPPFLAGS} -I. -I./src/vsimagine -I./src/imagine -I./extra $(pkg-config --cflags vapoursynth) -o extra/libp2p/v210.o extra/libp2p/v210.cpp
	  g++ -c -fPIC ${CXXFLAGS} -std=c++11 -Wno-missing-field-initializers ${CPPFLAGS} -I. -I./src/vsimagine -I./src/imagine -I./extra $(pkg-config --cflags vapoursynth) -o extra/libp2p/p2p_api.o extra/libp2p/p2p_api.cpp

	  g++ -c -fPIC ${CXXFLAGS} -std=c++11 ${CPPFLAGS} -I. -I./src/vsimagine -I./src/imagine -I./extra $(pkg-config --cflags vapoursynth) -o extra/vsxx/vsxx_pluginmain.o extra/vsxx/vsxx_pluginmain.cpp

	  g++ -c -fPIC ${CXXFLAGS} -std=c++11 ${CPPFLAGS} -I. -I./src/vsimagine -I./src/imagine -I./extra $(pkg-config --cflags vapoursynth) -o src/imagine/api/imagine.o src/imagine/api/imagine.cpp

	  g++ -c -fPIC ${CXXFLAGS} -std=c++11 ${CPPFLAGS} -I. -I./src/vsimagine -I./src/imagine -I./extra $(pkg-config --cflags vapoursynth) -o src/imagine/common/decoder.o src/imagine/common/decoder.cpp
	  g++ -c -fPIC ${CXXFLAGS} -std=c++11 ${CPPFLAGS} -I. -I./src/vsimagine -I./src/imagine -I./extra $(pkg-config --cflags vapoursynth) -o src/imagine/common/file_io.o src/imagine/common/file_io.cpp
	  g++ -c -fPIC ${CXXFLAGS} -std=c++11 ${CPPFLAGS} -I. -I./src/vsimagine -I./src/imagine -I./extra $(pkg-config --cflags vapoursynth) -o src/imagine/common/io_context.o src/imagine/common/io_context.cpp
	  g++ -c -fPIC ${CXXFLAGS} -std=c++11 ${CPPFLAGS} -I. -I./src/vsimagine -I./src/imagine -I./extra $(pkg-config --cflags vapoursynth) -o src/imagine/common/jumpman.o src/imagine/common/jumpman.cpp
	  g++ -c -fPIC ${CXXFLAGS} -std=c++11 ${CPPFLAGS} -I. -I./src/vsimagine -I./src/imagine -I./extra $(pkg-config --cflags vapoursynth) -o src/imagine/common/memory_io.o src/imagine/common/memory_io.cpp
	  g++ -c -fPIC ${CXXFLAGS} -std=c++11 ${CPPFLAGS} -I. -I./src/vsimagine -I./src/imagine -I./extra $(pkg-config --cflags vapoursynth) -o src/imagine/common/path.o src/imagine/common/path.cpp

	  g++ -c -fPIC ${CXXFLAGS} -std=c++11 ${CPPFLAGS} -I. -I./src/vsimagine -I./src/imagine -I./extra $(pkg-config --cflags vapoursynth) -DP2P_USER_NAMESPACE=im_p2p -o src/imagine/provider/bmp_decoder.o src/imagine/provider/bmp_decoder.cpp
	  g++ -c -fPIC ${CXXFLAGS} -std=c++11 ${CPPFLAGS} -I. -I./src/vsimagine -I./src/imagine -I./extra $(pkg-config --cflags vapoursynth) -DP2P_USER_NAMESPACE=im_p2p -o src/imagine/provider/jpeg_decoder.o src/imagine/provider/jpeg_decoder.cpp
	  g++ -c -fPIC ${CXXFLAGS} -std=c++11 ${CPPFLAGS} -I. -I./src/vsimagine -I./src/imagine -I./extra $(pkg-config --cflags vapoursynth) -DP2P_USER_NAMESPACE=im_p2p -o src/imagine/provider/png_decoder.o src/imagine/provider/png_decoder.cpp
	  g++ -c -fPIC ${CXXFLAGS} -std=c++11 ${CPPFLAGS} -I. -I./src/vsimagine -I./src/imagine -I./extra $(pkg-config --cflags vapoursynth) -DP2P_USER_NAMESPACE=im_p2p -o src/imagine/provider/tiff_decoder.o src/imagine/provider/tiff_decoder.cpp

	  g++ -c -fPIC ${CXXFLAGS} -std=c++11 ${CPPFLAGS} -I. -I./src/vsimagine -I./src/imagine -I./src/imagine/api -I./extra $(pkg-config --cflags vapoursynth) -o src/vsimagine/path.o src/vsimagine/path.cpp
	  g++ -c -fPIC ${CXXFLAGS} -std=c++11 ${CPPFLAGS} -I. -I./src/vsimagine -I./src/imagine -I./src/imagine/api -I./extra $(pkg-config --cflags vapoursynth) -o src/vsimagine/vsimagine.o src/vsimagine/vsimagine.cpp

	  ar r libimage.a extra/libp2p/v210.o extra/libp2p/p2p_api.o src/imagine/api/imagine.o src/imagine/common/decoder.o src/imagine/common/file_io.o src/imagine/common/io_context.o src/imagine/common/jumpman.o src/imagine/common/memory_io.o src/imagine/common/path.o src/imagine/provider/bmp_decoder.o src/imagine/provider/jpeg_decoder.o src/imagine/provider/png_decoder.o src/imagine/provider/tiff_decoder.o
	  ranlib libimage.a

	  g++ -fPIC ${CXXFLAGS} -std=c++11 -shared -L. -limage $(pkg-config --libs libpng libturbojpeg libtiff-4 libopenjp2 libavcodec libavformat libavutil libswscale) -fPIC ${LDFLAGS} -o libvs${_plug}.so extra/vsxx/vsxx_pluginmain.o src/vsimagine/path.o src/vsimagine/vsimagine.o"> Makefile
}

build() {
  cd "${_plug}"

  make
}

package() {
  cd "${_plug}"
  install -Dm755 "libvs${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/libvs${_plug}.so"
}
