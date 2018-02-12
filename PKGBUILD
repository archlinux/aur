# Maintainer: Alexander Susha <isushik94@gmail.com>
pkgname=kms-filters
pkgver=6.6.2
pkgrel=1
pkgdesc='Kurento filters module'
arch=('any')
url='http://www.kurento.org/'
license=('LGPL v2.1')
depends=('libsoup' 'kms-core' 'kms-elements' 'opencv')
makedepends=('cmake' 'pkg-config' 'libsoup' 'kms-core' 'kms-elements' 'opencv')
provides=(${pkgname})
conflicts=(${pkgname})
source=("https://github.com/Kurento/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('d970382ace5e03587a3107ef133095a5be7bbd9ae0dac90157051442277c0506')

prepare(){
    cd ${srcdir}/${pkgname}-${pkgver}

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

    cmake ${srcdir}/${pkgname}-${pkgver}/. -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_CXX_FLAGS="-Wno-deprecated-declarations"
}
package() {
    make -C build DESTDIR="${pkgdir}" install
}
