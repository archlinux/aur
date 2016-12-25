# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>

pkgname=php-kolabformat
pkgver=1.1.6
pkgrel=1
pkgdesc='PHP bindings for Kolab XML Format Schema Definitions Library'
url='http://www.kolab.org'
arch=('i686' 'x86_64')
license=('GPL')
depends=('libkolabxml' 'php')
makedepends=('cmake' 'boost' 'xsd' 'qt4' 'swig-git')
source=("http://mirror.kolabsys.com/pub/releases/libkolabxml-${pkgver}.tar.gz"
        "php7.patch")
sha256sums=('e48d7f5de1860a381da27981f6c70de1c9f38c4cd536bc6558b6529ce95f0677'
            '59b99b529ffecf01566ff10a8f33a087b34330cc95d92d86c45ad105c7144f98')

prepare() {
    cd "${srcdir}/libkolabxml-${pkgver}"
    patch -p1 < "${srcdir}/php7.patch"
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
    install -Dm755 "kolabformat.so" "${pkgdir}/usr/lib/php/modules/kolabformat.so"
    install -Dm644 "kolabformat.php" "${pkgdir}/usr/share/php/kolabformat.php"
}
