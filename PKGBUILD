# Maintainer:  Yigit Dallilar <yigit.dallilar at gmail dot com>

pkgname=ds9
pkgver=7.6
# need the grab a legacy openssl source and build ds9 against it
_sslver=1.0.2o
pkgrel=1
pkgdesc="SAOImage DS9: Astronomical Data Visualization Application"
url="http://hea-www.harvard.edu/RD/ds9/"
arch=('x86_64')
license=('GPL2')
provides=(ds9)
conflicts=(ds9-bin)
depends=()
options=(!strip)
makedepends=()
conflicts=()
replaces=()
backup=()
source=("https://github.com/SAOImageDS9/SAOImageDS9/archive/v${pkgver}.tar.gz"
        "https://www.openssl.org/source/openssl-${_sslver}.tar.gz"
        "ds9.desktop"
        "ds9.png")
md5sums=('23efdb3bc5c6c8581c8a52e4a1470e6e'
         '44279b8557c3247cbe324e2322ecd114'
         'f1738e4ec665ae9afd1b65b86e6a07f1'
         '9297d5738f5f462831075c483dc785d5')

prepare() {

    cd ${srcdir}
    sed -i "s|@SSLLIBS@|-L$(pwd)/openssl-${_sslver} -lssl|g" SAOImageDS9-${pkgver}/ds9/unix/Makefile.in
    sed -i "s|\$(TLSFLAGS)|\$(TLSFLAGS) --with-ssl-dir=$(pwd)/openssl-${_sslver} --disable-shared --prefix=$(pwd)/SAOImageDS9-${pkgver}/tmp|g" SAOImageDS9-${pkgver}/make.include

}

build() {

    cd ${srcdir}/openssl-${_sslver}
    ./config
    make

    cd ${srcdir}/SAOImageDS9-${pkgver}
    unix/configure
    make
}

package() {
    
    install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    install -Dm644 ${pkgname}.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png

    cd ${srcdir}/SAOImageDS9-${pkgver}
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm755 bin/ds9 ${pkgdir}/usr/bin/${pkgname}

}

# vim:set ts=4 sw=4 et:

