# Maintainer: Donatien Sattler <donatien-sattler [DOT] web |AT| laposte (DOT) net>
pkgname=yavalath
pkgver=1.1.1
pkgrel=3
pkgdesc="Play this 2 players board game against computer with SDL2 frontend."
arch=('x86_64')
url='https://gitlab.com/donatien-sattler/yavalath'
license=('custom:EUPL-1.2-or-later')
depends=('sdl2_image')
makedepends=('gtest' 'cmake' 'doxygen')
source=("https://gitlab.com/donatien-sattler/yavalath/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('00af72fc76da34bd2cfcac24b6fc99c0')
sha1sums=('014e629aa059c592ddfd4c09db922a5fbc7d4920')
sha224sums=('021bd59f378d6e07ad67921c83a00ae1ccb4be7725c736ae52c30b29')
sha256sums=('b38b9f2ae3c4236bf295d62111be3303612be5b2d7d78b87679910ceee28bd99')
sha384sums=('ef44bcf3c7229a45d54828527c2145c975ae82a4b6dec9a5d3e305e10d43ee514bc2cef77aa77e7cc51e94d8346a23ef')
sha512sums=('61be6f08bc5c9d1a2d2176b9a253c715078b2c5e37f8f13504d0c6b63188cf3fb8af19e01f40b4f2efec8fabd3304671c94f2e0c70f81d9a4c0c7156704ccf92')

build() {
    SOURCE_DATE_EPOCH=$(stat -c %Y "${pkgname}-${pkgver}/README.md")

    if [ -d "${pkgname}-${pkgver}" ] && [ -r "${pkgname}-${pkgver}" ]; then
        :
    else
        >&2 echo "Previously extracted folder doesn't exist or is not readable."
        exit 1
    fi

    cd "${pkgname}-${pkgver}"

    >&2 echo `pwd`

    mkdir build
    cd build
    

    cmake -DCMAKE_BUILD_TYPE=RELEASE .. -Wno-dev

    if [ "$?" != "0" ]; then
        >&2 echo "An error occured during cmake execution."
        exit 1
    fi
    
    cmake --build .
    
    if [ "$?" != "0" ]; then
        >&2 echo "An error occured during make execution."
        exit 1
    fi
}

check() {
    if [ -d "${pkgname}-${pkgver}/build/" ] && [ -r "${pkgname}-${pkgver}/build/" ]; then
        :
    else
        >&2 echo "Build folder is inexistent or not readable."
        exit 1
    fi

    cd "${pkgname}-${pkgver}/build/"

    ctest

    if [ "$?" != "0" ]; then
        >&2 echo "Some tests have failed."
        exit 1
    fi
}

package() {
    if [ -d "${pkgname}-${pkgver}/build/" ] && [ -r "${pkgname}-${pkgver}/build/" ]; then
        :
    else
        >&2 echo "Build folder is inexistent or not readable."
        exit 1
    fi

    cd "${pkgname}-${pkgver}/build/"

    cmake --install . --prefix="${pkgdir}/usr"

    if [ "$?" != "0" ]; then
        >&2 echo "Failed to install package using cmake --install."
        exit 1
    fi
}
