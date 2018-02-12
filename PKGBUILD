# Maintainer: Alexander Susha <isushik94@gmail.com>
pkgname=kms-core
pkgver=6.6.3
pkgrel=1
pkgdesc='Kurento core module'
arch=('any')
url='http://www.kurento.org/'
license=('LGPL v2.1')
depends=('boost-libs' 'glib2' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav' 'libsigc++' 'glibmm' 'kms-jsonrpc')
makedepends=('cmake' 'glib2' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav'
             'boost' 'boost-libs' 'libsigc++' 'glibmm' 'kms-cmake-utils>=1.3.2' 'kms-jsonrpc' 'kurento-module-creator')
provides=(${pkgname})
conflicts=(${pkgname})
source=("https://github.com/Kurento/${pkgname}/archive/${pkgver}.tar.gz"
        'SdpEndpoint.conf.json.patch')
sha256sums=('b0643e36e2e422678db31177f0682a4adefdc359eaf2eaf1546b336c3e2df439'
            'dfd717ed76d489e73459ddd00111282f6cecbc9d8f3f616bc750ddd5164ac0cd')

prepare(){
    cd ${srcdir}/${pkgname}-${pkgver}

    patch -Nup0 < ../SdpEndpoint.conf.json.patch

    for FILE in $(find . -type f)
    do
        sed -i -E "s/gstreamer\-((\w|\d)+\-)?1\.5/gstreamer-\11.0/g" $FILE
    done
}
build() {
    mkdir -p "build"
    cd "build"

    cmake ${srcdir}/${pkgname}-${pkgver}/. -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_CXX_FLAGS="-Wno-deprecated-declarations"
}
package() {
    make -C build DESTDIR="${pkgdir}" install
    mv ${pkgdir}/usr/etc ${pkgdir}/
}
