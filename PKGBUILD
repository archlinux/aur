# Maintainer: Adrià Cabello <adro.cc79 at protonmail dot com>
pkgname=xstudio
pkgver=0.9
pkgrel=4
pkgdesc="Media playback and review application designed for professionals working in the film and TV post production industries."
arch=('x86_64')
url="https://materialx.org/"
license=('Apache 2.0')
depends+=('cmake' 'opencolorio' 'spdlog' 'actor-framework' 'opencolorio' 'ffmpeg' 'openexr' 'python-sphinx_rtd_theme' 'pybind11' 'qt5-base' 'qt5-graphicaleffects' 'qt5-quickcontrols' 'qt5-declarative' 'qt5-tools')
provides=('xstudio')
source=(git+"https://github.com/AcademySoftwareFoundation/xstudio.git"
        "https://github.com/nlohmann/json/archive/refs/tags/v3.7.3.tar.gz"
        "xstudio.desktop")
md5sums=('SKIP'
         '846bbc611ce9ecd7d45d6554679245e1'
         '9071c306cfb8b02d8a50bdec53967880')

prepare () {
  #Recent build of nlohmann-json is not compatible with xstudio
  tar xzf v3.7.3.tar.gz

  cd json-3.7.3
  mkdir -p build
  cd build
  cmake .. -DJSON_BuildTests=Off
  make -j $JOBS
}

build() {
  _CMAKE_FLAGS+=(
    -DCMAKE_INSTALL_PREFIX:PATH=/opt/xstudio
    -DBUILD_DOCS=Off
    -Dnlohmann_json_DIR="${srcdir}"/json-3.7.3/build
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
