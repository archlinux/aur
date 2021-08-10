#!/bin/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

name=meshroom
fragment="#branch=develop"
pkgname=${name}-git
pkgver=2021.1.0.r93.gd312d635
pkgrel=1
pkgdesc="Meshroom is a free, open-source 3D Reconstruction Software based on the AliceVision framework."
arch=('i686' 'x86_64')
url="https://alicevision.github.io/"
license=('MPL2')
_depends_qt=(python-pyside2 qt5-quickcontrols{,2} qt5-3d qt5-graphicaleffects qt5-imageformats qt5-location qt5-svg)
#_depends_qt+=(qt5-datavis3d qt5-scxml)
depends=(alice-vision alembic openimageio python python-psutil "${_depends_qt[@]}")
makedepends=(git cmake python-setuptools python-cx_freeze patchelf)
source=("${name}::git+https://github.com/alicevision/meshroom.git${fragment}"
        "voctree::git+https://gitlab.com/alicevision/trainedVocabularyTreeData.git"
        "git+https://github.com/alicevision/QtOIIO.git"
        "git+https://github.com/alicevision/qmlAlembic.git"
        "pyside_property_error.patch"
        )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'e211783ead22d388c72f60bac7ab95d670a4d6ae196225c15038b5c9e7c80fdc')

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

  sed -i '1 i\#include <cmath>' "${srcdir}"/QtOIIO/src/jetColorMap.hpp
  sed -i 's|imageformats|plugins/imageformats|' "${srcdir}"/QtOIIO/src/imageIOHandler/CMakeLists.txt
  sed -i 's|OPENIMAGEIO_FOUND|OpenImageIO_FOUND|' "${srcdir}"/QtOIIO/CMakeLists.txt
  rm -rf "${srcdir}"/QtOIIO/cmake/
  sed -i '/find_package(IlmBase REQUIRED)/d' "${srcdir}"/qmlAlembic/CMakeLists.txt
  sed -i 's|ILMBASE_INCLUDE_DIR||' "${srcdir}"/qmlAlembic/src/CMakeLists.txt
  rm -rf "${srcdir}"/qmlAlembic/cmake/

  # avoid bug in pyside 5.15.2 (https://bugreports.qt.io/browse/PYSIDE-1426)
  patch -Np1 -i "$srcdir"/pyside_property_error.patch
}

build() {
  msg2 'build QtOIIO'
  cd "${srcdir}"/QtOIIO
  cmake -DCMAKE_INSTALL_PREFIX="/usr/lib/qt/" -DCMAKE_BUILD_TYPE=Release .
  make

  msg2 'build qmlAlembic'
  cd "${srcdir}"/qmlAlembic
  cmake -DCMAKE_INSTALL_PREFIX="/usr/lib/qt/" -DCMAKE_BUILD_TYPE=Release .
  make

  msg2 'build Meshroom'
  cd "${srcdir}"/${name}
  python setup.py build
}


package() {
  msg2 'install QtOIIO'
  cd "${srcdir}"/QtOIIO
  make DESTDIR="${pkgdir}" install

  msg2 'install qmlAlembic'
  cd "${srcdir}"/qmlAlembic
  make DESTDIR="${pkgdir}" install

  msg2 'install Meshroom'
  cd "${srcdir}"/${name}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 -t "${pkgdir}"/usr/share/${name} "${srcdir}"/voctree/vlfeat_K80L3.SIFT.tree
}
# vim:set ts=2 sw=2 et:
