# Maintainer: Alexander Susha <isushik94@gmail.com>
pkgname=kurento-media-server
pkgver=6.6.2
pkgrel=1
pkgdesc='Kurento Media Server'
arch=('any')
url='http://www.kurento.org/'
license=('LGPL v2.1')
depends=('boost-libs' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav' 'libsigc++' 'glibmm' 'kms-core' 'kms-elements' 'kms-filters')
makedepends=('cmake' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav' 'libsigc++' 'glibmm' 'kms-core' 'kms-elements' 'kms-filters')
provides=(${pkgname})
conflicts=(${pkgname})
source=("https://github.com/Kurento/${pkgname}/archive/${pkgver}.tar.gz"
        'kurento.conf.json.patch')
sha256sums=('cd1a6b3ce3fa869b58c4df4f307bf95e1dc7019c358097e9a7006e0e212c84b3'
            'db711ae29c104d2b28744cc695c2f8bc4c185668a681c2972a9a07701796e7f2')

prepare(){
    cd ${srcdir}/${pkgname}-${pkgver}

    patch -Nu < ../kurento.conf.json.patch

    for FILE in $(find . -type f)
    do
        sed -i -E "s/gstreamer\-((\w|\d)+\-)?1\.5/gstreamer-\11.0/g" $FILE
        sed -i -E "s/SSL_R_SHORT_READ/boost::asio::ssl::error::stream_truncated/g" $FILE
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
