#!/bin/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

# Configuration:
# Use: makepkg VAR1=0 VAR2=1 to enable(1) disable(0) a feature
# Use: {yay,paru} --mflags=VAR1=0,VAR2=1
# Use: aurutils --margs=VAR1=0,VAR2=1
# Use: VAR1=0 VAR2=1 pamac

((ENABLE_QTALICEVISION)) && components+=(qtAliceVision)
((DISABLE_CUDA)) && msg2 "DISABLE_CUDA valid only if 'alice-vision' was build with DISABLE_CUDA=1" >&2

name=meshroom
fragment="#branch=develop"
components+=(QtOIIO qmlAlembic)
pkgname=${name}-git
pkgver=2021.1.0.r630.g8e9128be
pkgrel=1
pkgdesc="Meshroom is a free, open-source 3D Reconstruction Software based on the AliceVision framework."
arch=('i686' 'x86_64')
url="https://alicevision.github.io/"
license=('MPL2')
provides=(${name}=${pkgver%.r*})
conflicts=(${name})
_depends_qt=(pyside2 qt5-quickcontrols{,2} qt5-3d qt5-graphicaleffects qt5-imageformats qt5-location qt5-svg qt5-charts)
#_depends_qt+=(qt5-datavis3d qt5-scxml)
depends=(alice-vision-git alembic openimageio python python-psutil "${_depends_qt[@]}")
makedepends=(git cmake python-{cx-freeze-qfix,idna,setuptools} patchelf)
((ENABLE_QTALICEVISION)) && makedepends+=(coin-or-lemon boost)
((ENABLE_QTALICEVISION&!DISABLE_CUDA)) && makedepends+=(popsift)
source=("${name}::git+https://github.com/alicevision/meshroom.git${fragment}"
        "voctree::git+https://gitlab.com/alicevision/trainedVocabularyTreeData.git"
        "git+https://github.com/alicevision/QtOIIO.git#branch=develop"
        "git+https://github.com/alicevision/qmlAlembic.git#branch=develop"
        )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
((ENABLE_QTALICEVISION)) && {
  source+=("git+https://github.com/alicevision/qtAliceVision.git#branch=develop")
  sha256sums+=('SKIP')
}

pkgver() {
  cd "$name"
  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}"/${name}
  msg2 "Hardcode camera_database and voctree default value"
  sed -i   "s:'ALICEVISION_VOCTREE', '':'ALICEVISION_VOCTREE', '/usr/share/${name}/vlfeat_K80L3.SIFT.tree':g" meshroom/nodes/aliceVision/*.py
  sed -i "s:'ALICEVISION_SENSOR_DB', '':'ALICEVISION_SENSOR_DB', '/usr/share/aliceVision/sensor_width_camera_database.txt':g" meshroom/nodes/aliceVision/*.py

# Fix for QtOIIO plugin to build against openexr:3
  sed -i '1 i\#include <cmath>' "${srcdir}"/QtOIIO/src/jetColorMap.hpp
  sed -i 's|imageformats|plugins/imageformats|' "${srcdir}"/QtOIIO/src/imageIOHandler/CMakeLists.txt
  sed -i 's|${OPENIMAGEIO_LIBRARIES}|OpenImageIO::OpenImageIO|g' "${srcdir}"/QtOIIO/src/{imageIOHandler,depthMapEntity}/CMakeLists.txt
  sed -i 's|${OPENIMAGEIO_INCLUDE_DIRS}|${OpenImageIO_INCLUDE_DIRS}|g' "${srcdir}"/QtOIIO/src/{imageIOHandler,depthMapEntity}/CMakeLists.txt
  sed -i 's|OPENIMAGEIO_FOUND|OpenImageIO_FOUND|' "${srcdir}"/QtOIIO/CMakeLists.txt
  sed -i 's|isfinite|std::isfinite|' "${srcdir}"/QtOIIO/src/depthMapEntity/DepthMapEntity.cpp
  rm -rf "${srcdir}"/QtOIIO/cmake/

# Fix for qmlAlembic plugin to build against openexr:3
  sed -i '/find_package(IlmBase REQUIRED)/d' "${srcdir}"/qmlAlembic/CMakeLists.txt
  sed -i 's|${ILMBASE_INCLUDE_DIR}||' "${srcdir}"/qmlAlembic/src/CMakeLists.txt
  rm -rf "${srcdir}"/qmlAlembic/cmake/
}

build() {
  for component in "${components[@]}" ; do
    msg2 "build $component"
    cd "${srcdir}/$component"
    cmake -DCMAKE_INSTALL_PREFIX="/usr/lib/qt" -DCMAKE_BUILD_TYPE=Release .
    make
  done

  msg2 'build Meshroom'
  cd "${srcdir}"/${name}
  python setup.py build
}


package() {
  for component in "${components[@]}" ; do
    msg2 "install $component"
    cd "${srcdir}/$component"
    make DESTDIR="${pkgdir}" install
  done

  msg2 'install Meshroom'
  cd "${srcdir}"/${name}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 -t "${pkgdir}"/usr/share/${name} "${srcdir}"/voctree/vlfeat_K80L3.SIFT.tree
}
# vim:set ts=2 sw=2 et:
