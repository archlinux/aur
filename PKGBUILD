# Maintainer: Alexander Susha <isushik94@gmail.com>
pkgname=kms-elements
pkgver=6.6.3
pkgrel=1
pkgdesc='Kurento elements module'
arch=('any')
url='http://www.kurento.org/'
license=('LGPL v2.1')
depends=('boost-libs' 'libnice' 'gstreamer' 'gst-plugins-openwebrtc' 'libsoup' 'openssl-1.0' 'kms-core')
makedepends=('cmake' 'libnice' 'boost-libs' 'gstreamer' 'gst-plugins-openwebrtc' 'libsoup' 'openssl-1.0' 'kms-core' 'valgrind')
provides=(${pkgname})
conflicts=(${pkgname})
source=("https://github.com/Kurento/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('38b69a36009a17f3f74d822a594bb1faff7e0859733893667bcd936e10dfe26d')

prepare(){
    cd ${srcdir}/${pkgname}-${pkgver}

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
