# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

name=meshroom
#fragment="#commit=9bd70ed8ace83c6dde174178e17c5147bb50248f"
fragment="#tag=v2021.1.0"
pkgname=${name}
pkgver=${fragment#\#tag=v}
pkgrel=1
pkgdesc="Meshroom is a free, open-source 3D Reconstruction Software based on the AliceVision framework."
arch=('i686' 'x86_64')
url="https://alicevision.github.io/"
license=('MPL2')
groups=()
_depends_qt=(python-pyside2 qt5-quickcontrols{,2} qt5-3d qt5-graphicaleffects qt5-imageformats qt5-location qt5-svg qt5-charts)
#_depends_qt+=(qt5-datavis3d qt5-scxml)
depends=(alice-vision alembic openimageio python python-psutil "${_depends_qt[@]}")
makedepends=(git cmake python-{cx_freeze,idna,setuptools} patchelf)
source=("${pkgname}::git+https://github.com/alicevision/meshroom.git${fragment}"
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

prepare() {
  cd "${srcdir}"/${pkgname}
  msg2 "Hardcode camera_database and voctree default value"
  sed -i   "s:'ALICEVISION_VOCTREE', '':'ALICEVISION_VOCTREE', '/usr/share/${pkgname}/vlfeat_K80L3.SIFT.tree':g" meshroom/nodes/aliceVision/*.py
  sed -i "s:'ALICEVISION_SENSOR_DB', '':'ALICEVISION_SENSOR_DB', '/usr/share/aliceVision/cameraSensors.db':g" meshroom/nodes/aliceVision/*.py
  sed -i '1 i\#include <cmath>' "${srcdir}"/QtOIIO/src/jetColorMap.hpp
  sed -i 's|imageformats|plugins/imageformats|' "${srcdir}"/QtOIIO/src/imageIOHandler/CMakeLists.txt

  # avoid bug in pyside 5.15.2 (https://bugreports.qt.io/browse/PYSIDE-1426)
  patch -Np1 -i "$srcdir"/pyside_property_error.patch
}

build() {
  cd "${srcdir}"/QtOIIO
  cmake -DCMAKE_INSTALL_PREFIX="/usr/lib/qt/" -DCMAKE_BUILD_TYPE=Release .
  make

  cd "${srcdir}"/qmlAlembic
  cmake -DCMAKE_INSTALL_PREFIX="/usr/lib/qt/" -DCMAKE_BUILD_TYPE=Release .
  make

  cd "${srcdir}"/${pkgname}
  python setup.py build
}


package() {
  cd "${srcdir}"/QtOIIO
  make DESTDIR="${pkgdir}" install

  cd "${srcdir}"/qmlAlembic
  make DESTDIR="${pkgdir}" install

  cd "${srcdir}"/${pkgname}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 -t "${pkgdir}"/usr/share/${pkgname} "${srcdir}"/voctree/vlfeat_K80L3.SIFT.tree
}
# vim:set ts=2 sw=2 et:
