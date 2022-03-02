# Maintainer: William Gathoye <william + aur at gathoye dot be>

pkgname=orthanc-plugin-web-viewer
pkgver=2.8
pkgrel=2
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
    "https://www.orthanc-server.com/downloads/get.php?path=/plugin-webviewer/OrthancWebViewer-${pkgver}.tar.gz"
)
sha512sums=(
    '943e61bcf086ea15da992880b7d40f98a6a5a5b98c772113e5b7071002cb163958a428988e3136b04a2fd6b334124924977ad5205cbe7ee3cb2102dd5f454616'
)

prepare() {
    cd OrthancWebViewer-"${pkgver}"/
    patch -p2 < "../../patch-orthanc-force-version-lib.patch"
    patch -p2 < "../../patch-orthanc-force-version-lib-digest.patch"
}

build() {
    cd OrthancWebViewer-"${pkgver}"/
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
