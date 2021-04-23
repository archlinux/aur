# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

name=meshroom
#fragment="#commit=9bd70ed8ace83c6dde174178e17c5147bb50248f"
fragment="#branch=develop"
pkgname=${name}-git
pkgver=2020.1.1.r176.g8d0cd745
pkgrel=1
pkgdesc="Meshroom is a free, open-source 3D Reconstruction Software based on the AliceVision framework."
arch=('i686' 'x86_64')
url="http://alicevision.github.io/"
license=('MPL2')
groups=()
_depends_qt=(qt5-quickcontrols{,2} qt5-3d qt5-graphicaleffects qt5-imageformats qt5-location qt5-svg)
#_depends_qt+=(qt5-datavis3d qt5-scxml)
depends=(alice-vision alembic openimageio python python-psutil ${_depends_qt[@]})
makedepends=(python-pip git cmake python-setuptools python-cx_freeze patchelf)
source=("${name}::git+https://github.com/alicevision/meshroom.git${fragment}"
        "voctree::git+https://gitlab.com/alicevision/trainedVocabularyTreeData.git"
        "git+https://github.com/alicevision/QtOIIO.git"
        "git+https://github.com/alicevision/qmlAlembic.git"
        )
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
  cd "$name"
  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${srcdir}/${name}
  msg2 "Hardcode camera_database and voctree default value"
  sed -i   "s:'ALICEVISION_VOCTREE', '':'ALICEVISION_VOCTREE', '/usr/share/${name}/vlfeat_K80L3.SIFT.tree':g" meshroom/nodes/aliceVision/*.py
  sed -i "s:'ALICEVISION_SENSOR_DB', '':'ALICEVISION_SENSOR_DB', '/usr/share/aliceVision/sensor_width_camera_database.txt':g" meshroom/nodes/aliceVision/*.py
  sed -i '1 i\#include <cmath>' ${srcdir}/QtOIIO/src/jetColorMap.hpp
  sed -i 's|imageformats|plugins/imageformats|' ${srcdir}/QtOIIO/src/imageIOHandler/CMakeLists.txt
}

build() {
  cd ${srcdir}/QtOIIO
  cmake -DCMAKE_INSTALL_PREFIX="/usr/lib/qt/" -DCMAKE_BUILD_TYPE=Release .
  make

  cd ${srcdir}/qmlAlembic 
  cmake -DCMAKE_INSTALL_PREFIX="/usr/lib/qt/" -DCMAKE_BUILD_TYPE=Release .
  make

  cd ${srcdir}/${name}
  sed -i '/^PySide2/s/5.14.1/5.15.2/' requirements.txt
  pip install --user -r requirements.txt
  python setup.py build
}


package() {
  cd ${srcdir}/QtOIIO
  make DESTDIR=${pkgdir} install

  cd ${srcdir}/qmlAlembic 
  make DESTDIR=${pkgdir} install

  cd ${srcdir}/${name}
  python setup.py install --root=${pkgdir} --optimize=1 --skip-build
  install -Dm644 -t ${pkgdir}/usr/share/${name} ${srcdir}/voctree/vlfeat_K80L3.SIFT.tree
}
# vim:set ts=2 sw=2 et:
