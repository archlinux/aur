# $Id:
# Maintainer: Ivailo Monev <xakepa10@gmail.com>

pkgname=copperspice-git
pkgver=1.2.022bcf5
pkgrel=1
pkgdesc='C++ library derived from the existing Qt 4.8 framework'
arch=('i686' 'x86_64')
url='http://www.copperspice.com/'
license=('LGPL' 'FDL' 'custom')
depends=('openssl' 'zlib' 'cups' 'alsa-lib' 'gtk2' 'nas' 'libgl' 'libice'
        'libsm' 'libxcursor' 'libxext' 'libxfixes' 'libxi' 'libxinerama'
        'libxrandr' 'libxrender' 'libx11' 'fontconfig' 'freetype2' 'glib2'
        'gstreamer0.10-base-plugins' 'libxml2')
makedepends=('cmake' 'git' 'postgresql' 'mariadb' 'mesa')
optdepends=('postgresql-libs: PostgreSQL driver'
        'libmariadbclient: MariaDB driver')
source=("git+https://github.com/fluxer/copperspice.git#branch=cs-1.2")
sha1sums=('SKIP')
conflicts=('copperspice')
options=('debug')

pkgver() {
    cd copperspice
    printf "1.2.%s" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../copperspice \
        -DCMAKE_BUILD_TYPE=RelWithDbgInfo \
        -DCMAKE_SKIP_RPATH=OFF \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc \
        -DCMAKE_INSTALL_INCLUDEDIR=include/copperspice \
        -DTOOLS_SUFFIX=-cs
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install

    install -vDm644 ../copperspice/license/LGPL_EXCEPTION.txt \
        "${pkgdir}/usr/share/licenses/copperspice-git/LGPL_EXCEPTION.txt"
}
