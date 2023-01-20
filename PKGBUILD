# Maintainer: Adrià Cabello <adro.cc79 at protonmail dot com>
pkgname=xstudio
pkgver=0.9
pkgrel=1
pkgdesc="Media playback and review application designed for professionals working in the film and TV post production industries."
arch=('x86_64')
url="https://materialx.org/"
license=('Apache')
depends+=('cmake' 'opencolorio' 'actor-framework' 'opencolorio' 'ffmpeg' 'openexr' 'python-sphinx_rtd_theme')
provides=('xstudio')
source=(git+"https://github.com/AcademySoftwareFoundation/xstudio.git"
        "https://github.com/nlohmann/json/archive/refs/tags/v3.7.3.tar.gz"
        "xstudio.desktop")
md5sums=('SKIP'
         '846bbc611ce9ecd7d45d6554679245e1'
         'b315ee01abbbf9605b6449add7f03a8c')

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
