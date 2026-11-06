# Maintainer: William Gathoye <william + aur at gathoye dot be>

pkgname=orthanc-plugin-web-viewer
pkgver=2.10
pkgrel=1
pkgdesc='Web viewer of medical images plugin for Orthanc'
arch=('x86_64' 'i686')
url='https://book.orthanc-server.com/plugins/webviewer.html'
license=('AGPL3')

depends=(
    'orthanc'
)
makedepends=(
    'boost' 'cmake' 'gtest' 'make'
)
source=(
    "https://orthanc.uclouvain.be/downloads/sources/orthanc-webviewer/OrthancWebViewer-${pkgver}.tar.gz"
)
sha512sums=(
    '50af60d201fcf684e407bc716de33fd5b8514952501d8b0e71c1d7e7aeaf5fbaf162286915e66813d06208ba8790f6f8c684f37274ce21d3311bd94448ad8021'
)

build() {
    cd OrthancWebViewer-"${pkgver}"/
    cmake \
        -DSTATIC_BUILD=OFF \
        -DALLOW_DOWNLOADS=ON \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
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
