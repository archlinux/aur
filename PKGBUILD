# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>

pkgname=php56-kolabformat
pkgver=1.1.2
pkgrel=1
pkgdesc='PHP bindings for Kolab XML Format Schema Definitions Library'
url='http://www.kolab.org'
arch=('i686' 'x86_64')
license=('GPL')
depends=('libkolabxml' 'php56')
makedepends=('cmake' 'boost' 'xsd' 'qt4' 'swig')
provides=('php-kolabformat')
source=("http://mirror.kolabsys.com/pub/releases/libkolabxml-${pkgver}.tar.gz"
        "php56.patch")
sha256sums=('1de632572da1421c0e4b580cba763932bc943d457743abc7fb836e6200861fac'
            'c7162b0078d16d3a82d961b6da6b7862fae81e4a04b2e5fddeb7306af302f661')

prepare() {
    cd "${srcdir}/libkolabxml-${pkgver}"
    patch -p1 < "${srcdir}/php56.patch"
    mkdir "${srcdir}/build"
}

build() {
    cd "${srcdir}/build"
    cmake ../libkolabxml-${pkgver} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTS=OFF \
        -DPHP_BINDINGS=true
    make
}

package() {
    cd "${srcdir}/build/src/php"

    # Install manually to avoid putting kolabformat.php in /usr/lib/php/modules
    # make DESTDIR="${pkgdir}" install
    install -Dm755 "kolabformat.so" "${pkgdir}/usr/lib/php56/modules/kolabformat.so"
    install -Dm644 "kolabformat.php" "${pkgdir}/usr/share/php56/kolabformat.php"
}
