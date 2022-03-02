# Maintainer: William Gathoye <william + aur at gathoye dot be>

pkgname=orthanc-plugin-dicomweb
pkgver=1.7
pkgrel=3
pkgdesc='Extends Orthanc with support of the DICOMweb protocols'
arch=('x86_64' 'i686')
url='https://book.orthanc-server.com/plugins/dicomweb.html'
license=('AGPL3')

depends=(
    'orthanc'
)
makedepends=(
    'boost' 'cmake' 'gtest' 'make'
)
source=(
    "https://www.orthanc-server.com/downloads/get.php?path=/plugin-dicom-web/OrthancDicomWeb-${pkgver}.tar.gz"
)
sha512sums=(
    'b4f95094ccbd8253415680ed355da39685398f0868445434f8ecb5e93932ef4462e98093dbe3dac5bbe5ec246f6d42081d732ab9089d3de43bb939fffca599e7'
)

build() {
    cd OrthancDicomWeb-"${pkgver}"/
    cmake \
        -DSTATIC_BUILD=OFF \
        -DALLOW_DOWNLOADS=ON \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -B"${srcdir}"/build

    cd "${srcdir}"/build
    make
}

check() {
    cd "${srcdir}"/build
    ./UnitTests
}

package() {
    cd "${srcdir}"/build
    cmake --build "${srcdir}"/build --target install -- DESTDIR="${pkgdir}"
}
