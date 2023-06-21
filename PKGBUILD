# Maintainer: Adrià Cabello <adro.cc79 at protonmail dot com>
pkgname=xstudio
pkgver=0.10
pkgrel=2
pkgdesc="Media playback and review application designed for professionals working in the film and TV post production industries."
arch=('x86_64')
url="https://materialx.org/"
license=('Apache 2.0')
depends+=('cmake' 'opencolorio' 'spdlog' 'actor-framework' 'opencolorio' 'openexr' 'python-sphinx_rtd_theme' 'pybind11' 'qt5-base' 'qt5-graphicaleffects' 'qt5-quickcontrols' 'qt5-declarative' 'qt5-tools' 'python-breathe')
provides=('xstudio')
source=(git+"https://github.com/AcademySoftwareFoundation/xstudio.git"
        "https://github.com/nlohmann/json/archive/refs/tags/v3.7.3.tar.gz"
        "https://ffmpeg.org/releases/ffmpeg-5.1.tar.bz2"
        "xstudio.desktop"
        "reproc.patch")
md5sums=('SKIP'
         '846bbc611ce9ecd7d45d6554679245e1'
         '0e5091837a9b950c81e1d5aaba281e51'
         '9071c306cfb8b02d8a50bdec53967880'
         'eb77c76ef2533e91ae0f31e6f6485ab0')

prepare () {
  #Recent builds of nlohmann-json & ffmpeg aren't compatible with xstudio

  mkdir -p "${srcdir}"/json
  cd "${srcdir}"/json
  cmake ../json-3.7.3 -DJSON_BuildTests=Off
  make -j $JOBS

  sed -i '358,364s/^/\/\/ /' "${srcdir}"/ffmpeg-5.1/libavutil/hwcontext_vulkan.c
  cd "${srcdir}"/ffmpeg-5.1
  ./configure \
    --extra-libs=-lpthread \
    --extra-libs=-lm  \
    --enable-gpl  \
    --enable-libfdk_aac  \
    --enable-libfreetype  \
    --enable-libmp3lame  \
    --enable-libopus  \
    --enable-libvpx  \
    --enable-libx264  \
    --enable-libx265  \
    --enable-shared  \
    --enable-nonfree
  make -j  $JOBS
  make DESTDIR="${srcdir}"/ffmpeg -C "${srcdir}"/ffmpeg-5.1 install

  patch --directory="${srcdir}"/xstudio --forward --strip=1 --input="${srcdir}/reproc.patch"
#   sed -i 's#extern/reproc#/usr#g' "${srcdir}"/xstudio/CMakeLists.txt

}

build() {
#   export CC=clang
#   export CXX=clang++

  _CMAKE_FLAGS+=(
    -DCMAKE_INSTALL_PREFIX:PATH=/opt/xstudio
    -DBUILD_DOCS=ON
    -Dnlohmann_json_DIR="${srcdir}"/json
    -DFFMPEG_ROOT="${srcdir}"/ffmpeg/usr/local
  )
  
  cmake -S xstudio -B build -G Ninja "${_CMAKE_FLAGS[@]}"

  ninja -C build ${MAKEFLAGS:--j12}
}

package() {
  install -d ${pkgdir}/opt
  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/share/icons/hicolor/256x256/apps
  install -d ${pkgdir}/usr/share/applications

  cp -r "${srcdir}"/build/bin "${pkgdir}"/opt/xstudio

  ln -s /opt/xstudio/xstudio.bin ${pkgdir}/usr/bin/xstudio

  cp "${srcdir}"/xstudio/ui/qml/xstudio/images/xstudio_logo_256_v1.svg ${pkgdir}/usr/share/icons/hicolor/256x256/apps/xstudio.svg
  cp "${srcdir}"/xstudio.desktop ${pkgdir}/usr/share/applications/
}
