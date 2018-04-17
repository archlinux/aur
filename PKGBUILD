# Maintainer: Alexander Susha <isushik94@gmail.com>
pkgname=kms-elements
pkgver=6.7.1
pkgrel=1
pkgdesc='Kurento elements module'
arch=('any')
url='http://www.kurento.org/'
license=('LGPL v2.1')
depends=('boost-libs' 'libnice' 'gstreamer' 'gst-plugins-openwebrtc' 'libsoup' 'openssl-1.0' 'kms-core>=6.7.0')
makedepends=('cmake' 'libnice' 'boost-libs' 'gstreamer' 'gst-plugins-openwebrtc' 'libsoup' 'openssl-1.0' 'kms-core>=6.7.0' 'valgrind')
provides=(${pkgname})
conflicts=(${pkgname})
source=("https://github.com/Kurento/${pkgname}/archive/${pkgver}.tar.gz"
        'kmselements.c.patch'
        'kmsrecorderendpoint.c.patch'
        'kmsrtpendpoint.c.patch'
        'kmswebrtcendpoint.c.patch'
        'kmswebrtc.c.patch')
sha256sums=('880f37343aed8165aa08e8b8f05a99455cfd1f37e59bebc224bf77737ac5d147'
            'a158f1da9ae727523da02b53b2014fdc5de0a2239b0b187771f3eec6d85defee'
            'e705e135da4dea3197967ab067c2dde898197b054548baa3337930ca727328c0'
            '02e6075f1f29a46a2df13655d3186ac23535de24489047126ed7c25d77afbcf3'
            'a923b2ebd0cb8ee332c7e5ce7d76d8fa2558c67ddfb1cdeaadb8774853f3cb66'
            'aa12fece95385cfc6c7522b2afe6101220fa3215b9d03fcb30de7eb1cd06032a')

prepare(){
    cd ${srcdir}/${pkgname}-${pkgver}

    patch -Nup0 < ../kmselements.c.patch
    patch -Nup0 < ../kmsrecorderendpoint.c.patch
    patch -Nup0 < ../kmsrtpendpoint.c.patch
    patch -Nup0 < ../kmswebrtcendpoint.c.patch
    patch -Nup0 < ../kmswebrtc.c.patch

    for FILE in $(find . -type f)
    do
        sed -i -E "s/gstreamer\-((\w|\d)+\-)?1\.5/gstreamer-\11.0/g" $FILE
    done
}
build() {
    mkdir -p "build"
    cd "build"

    cmake ${srcdir}/${pkgname}-${pkgver}/. -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_C_FLAGS="-Wno-incompatible-pointer-types" -DCMAKE_CXX_FLAGS="-Wno-deprecated-declarations"
}
package() {
    make -C build DESTDIR="${pkgdir}" install
    mv ${pkgdir}/usr/etc ${pkgdir}/
}
