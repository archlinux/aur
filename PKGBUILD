# Maintainer: Alexander Susha <isushik94@gmail.com>
pkgname=kms-filters
pkgver=6.7.1
pkgrel=1
pkgdesc='Kurento filters module'
arch=('any')
url='http://www.kurento.org/'
license=('LGPL v2.1')
depends=('libsoup' 'kms-core>=6.7.0' 'kms-elements>=6.7.0' 'opencv')
makedepends=('cmake' 'pkg-config' 'libsoup' 'kms-core>=6.7.0' 'kms-elements>=6.7.0' 'opencv')
provides=(${pkgname})
conflicts=(${pkgname})
source=("https://github.com/Kurento/${pkgname}/archive/${pkgver}.tar.gz"
        'opencvfilter.c.patch')
sha256sums=('d26b751e282657c8406bdf6d0d39b8c3472132d7692375437c72ec52adc1b13f'
            '36f865b924dcb2fc85e9c00bd06a47daeeccbf633085886b21c288ae5000564a')

prepare(){
    cd ${srcdir}/${pkgname}-${pkgver}

    patch -Nup0 < ../opencvfilter.c.patch

    for FILE in $(find . -type f)
    do
        sed -i -E "s/gstreamer\-((\w|\d)+\-)?1\.5/gstreamer-\11.0/g" $FILE
    done

    sed -i -E "s/set\(OPENCV_REQUIRED \^2\.0\.0\)/set(OPENCV_REQUIRED ^3.0.0)/g" CMakeLists.txt

    sed -i -E "s/add_subdirectory\(facedetector\)/#add_subdirectory(facedetector)/g" src/gst-plugins/CMakeLists.txt
    sed -i -E "s/add_subdirectory\(faceoverlay\)/#add_subdirectory(faceoverlay)/g" src/gst-plugins/CMakeLists.txt
    sed -i -E "s/add_subdirectory\(imageoverlay\)/#add_subdirectory(imageoverlay)/g" src/gst-plugins/CMakeLists.txt
    sed -i -E "s/add_subdirectory\(movementdetector\)/#add_subdirectory(movementdetector)/g" src/gst-plugins/CMakeLists.txt
    #sed -i -E "s/add_subdirectory\(opencvfilter\)/#add_subdirectory(opencvfilter)/g" src/gst-plugins/CMakeLists.txt
    sed -i -E "s/add_subdirectory\(logooverlay\)/#add_subdirectory(logooverlay)/g" src/gst-plugins/CMakeLists.txt
}
build() {
    mkdir -p "build"
    cd "build"

    cmake ${srcdir}/${pkgname}-${pkgver}/. -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_CXX_FLAGS="-Wno-deprecated-declarations -Wno-catch-value"
}
package() {
    make -C build DESTDIR="${pkgdir}" install
}
