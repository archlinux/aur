# Maintainer: Alexander Susha <isushik94@gmail.com>
pkgname=kms-core
pkgver=6.7.1
pkgrel=3
pkgdesc='Kurento core module'
arch=('any')
url='http://www.kurento.org/'
license=('LGPL v2.1')
depends=('boost-libs' 'glib2' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav' 'libsigc++' 'glibmm' 'kms-jsonrpc>=6.7.0')
makedepends=('cmake' 'glib2' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav'
             'boost' 'boost-libs' 'libsigc++' 'glibmm' 'kms-cmake-utils>=6.7.0' 'kms-jsonrpc>=6.7.0' 'kurento-module-creator>=6.7.0')
provides=(${pkgname})
conflicts=(${pkgname})
source=("https://github.com/Kurento/${pkgname}/archive/${pkgver}.tar.gz"
        'SdpEndpoint.conf.json.patch'
        'kmscore.c.patch')
sha256sums=('06c23218358ea1ae983dba265417f8be11748826b99cbe9e2eafd161373c637a'
            'dfd717ed76d489e73459ddd00111282f6cecbc9d8f3f616bc750ddd5164ac0cd'
            'e2f76510bdeb205808284942fb38d035bfbc17d7a71f544fc19d94a70f87baf4')

prepare(){
    cd ${srcdir}/${pkgname}-${pkgver}

    patch -Nup0 < ../SdpEndpoint.conf.json.patch
    patch -Nup0 < ../kmscore.c.patch

    for FILE in $(find . -type f)
    do
        sed -i -E "s/gstreamer\-((\w|\d)+\-)?1\.5/gstreamer-\11.0/g" $FILE
    done
}
build() {
    mkdir -p "build"
    cd "build"

    cmake ${srcdir}/${pkgname}-${pkgver}/. -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_C_FLAGS="-Wno-deprecated-declarations" -DCMAKE_CXX_FLAGS="-Wno-deprecated-declarations -Wno-catch-value"
}
package() {
    make -C build DESTDIR="${pkgdir}" install
    mv ${pkgdir}/usr/etc ${pkgdir}/
}
