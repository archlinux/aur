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
#fragment="#commit=9bd70ed8ace83c6dde174178e17c5147bb50248f"
fragment="#tag=v2021.1.0"
components+=(QtOIIO qmlAlembic)
pkgname=${name}
pkgver=${fragment#\#tag=v}
pkgrel=6
pkgdesc="Meshroom is a free, open-source 3D Reconstruction Software based on the AliceVision framework."
arch=('i686' 'x86_64')
url="https://alicevision.github.io/"
license=('MPL2')
_depends_qt=(pyside2 qt5-quickcontrols{,2} qt5-3d qt5-graphicaleffects qt5-imageformats qt5-location qt5-svg qt5-charts)
#_depends_qt+=(qt5-datavis3d qt5-scxml)
depends=(alice-vision alembic openimageio python python-psutil "${_depends_qt[@]}")
makedepends=(git cmake python-{cx-freeze-qfix,idna,setuptools} patchelf)
((ENABLE_QTALICEVISION)) && makedepends+=(coin-or-lemon boost)
((ENABLE_QTALICEVISION&!DISABLE_CUDA)) && makedepends+=(popsift)
source=("${pkgname}::git+https://github.com/alicevision/meshroom.git${fragment}"
        "voctree::git+https://gitlab.com/alicevision/trainedVocabularyTreeData.git"
        "git+https://github.com/alicevision/QtOIIO.git${fragment}"
        "git+https://github.com/alicevision/qmlAlembic.git${fragment}"
        "pyside_property_error.patch"
        "Fix-incompatibility-with-recent-cx_Freeze.patch"
        )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'e211783ead22d388c72f60bac7ab95d670a4d6ae196225c15038b5c9e7c80fdc'
            '40ee489604627e5be1b8ce5f3fdd4b1828a5588427fda298b61aa37beb9125c5')
((ENABLE_QTALICEVISION)) && {
  source+=("git+https://github.com/alicevision/qtAliceVision.git#commit=517fc5ffb43471b12f71aa8b9881cf0634647a93^")
  sha256sums+=('SKIP')
}


prepare() {
  cd "${srcdir}"/${pkgname}
  msg2 "Hardcode camera_database and voctree default value"
  sed -i   "s:'ALICEVISION_VOCTREE', '':'ALICEVISION_VOCTREE', '/usr/share/${pkgname}/vlfeat_K80L3.SIFT.tree':g" meshroom/nodes/aliceVision/*.py
  sed -i "s:'ALICEVISION_SENSOR_DB', '':'ALICEVISION_SENSOR_DB', '/usr/share/aliceVision/cameraSensors.db':g" meshroom/nodes/aliceVision/*.py
# Fix for QtOIIO plugin to build against openexr:3
  sed -i '1 i\#include <cmath>' "${srcdir}"/QtOIIO/src/jetColorMap.hpp
  sed -i 's|imageformats|plugins/imageformats|' "${srcdir}"/QtOIIO/src/imageIOHandler/CMakeLists.txt
  sed -i 's|${OPENIMAGEIO_LIBRARIES}|OpenImageIO::OpenImageIO|g' "${srcdir}"/QtOIIO/src/{imageIOHandler,depthMapEntity}/CMakeLists.txt
  sed -i 's|${OPENIMAGEIO_INCLUDE_DIRS}|${OpenImageIO_INCLUDE_DIRS}|g' "${srcdir}"/QtOIIO/src/{imageIOHandler,depthMapEntity}/CMakeLists.txt
  sed -i 's|OPENIMAGEIO_FOUND|OpenImageIO_FOUND|' "${srcdir}"/QtOIIO/CMakeLists.txt
  rm -rf "${srcdir}"/QtOIIO/cmake/

# Fix for qmlAlembic plugin to build against openexr:3
  sed -i '/find_package(IlmBase REQUIRED)/d' "${srcdir}"/qmlAlembic/CMakeLists.txt
  sed -i 's|${ILMBASE_INCLUDE_DIR}||' "${srcdir}"/qmlAlembic/src/CMakeLists.txt
  rm -rf "${srcdir}"/qmlAlembic/cmake/

  # avoid bug in pyside 5.15.2 (https://bugreports.qt.io/browse/PYSIDE-1426)
  patch -Np1 -i "$srcdir"/pyside_property_error.patch
  # back port b9a7174886d7a215818f382f9d5c05226f86a3ff
  patch -Np1 -i "$srcdir"/Fix-incompatibility-with-recent-cx_Freeze.patch
}

build() {
  for component in "${components[@]}" ; do
    msg2 "build $component"
    cd "${srcdir}/$component"
#   cmake -DCMAKE_INSTALL_PREFIX="/usr/lib/${name^}-${pkgver%.r*}/qtPlugins" -DCMAKE_BUILD_TYPE=Release .
    cmake -DCMAKE_INSTALL_PREFIX="/usr/lib/qt" -DCMAKE_BUILD_TYPE=Release .
    make
  done

  msg2 'build Meshroom'
  cd "${srcdir}"/${pkgname}
  python setup.py build
}


package() {
  for component in "${components[@]}" ; do
    msg2 "install $component"
    cd "${srcdir}/$component"
    make DESTDIR="${pkgdir}" install
  done

  msg2 'install Meshroom'
  cd "${srcdir}"/${pkgname}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 -t "${pkgdir}"/usr/share/${pkgname} "${srcdir}"/voctree/vlfeat_K80L3.SIFT.tree
}
# vim:set ts=2 sw=2 et:
