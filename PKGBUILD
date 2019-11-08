# Maintainer: Jon Noble <jonnobleuk@gmail.com>
pkgname=mediahandling
pkgver=0.0.4
pkgrel=2
pkgdesc="A library solely intended for the use in the project Chestnut by handling all media-file operations"
arch=(x86_64)
url="https://github.com/jonno85uk/mediahandling"
license=('BSD')
depends=('ffmpeg' 'boost-libs')
makedepends=('cmake') 
provides=("${pkgname%}")
source=("https://github.com/jonno85uk/mediahandling/archive/${pkgver}.tar.gz")
md5sums=('a414afd10eb21b0b678422707dadcee6')

prepare() {
    rm -rf "mediahandling"
    rm -rf ${pkgdir}
    tar xaf ${pkgver}.tar.gz
    mv mediahandling-${pkgver} mediahandling
    cd "$srcdir/mediahandling"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=${pkgdir}/usr/
}

build() {
    cd "$srcdir/mediahandling"
    CORES=$(cat /proc/cpuinfo | grep -c "vendor_id")
    make -j${CORES} -l${CORES} VERBOSE=1
}


package() {
    cd "$srcdir/mediahandling"
    make install
    # Temporary until CMakeLists.txt is updated
    mkdir -p ${pkgdir}/usr/include/mediahandling/
    mkdir -p ${pkgdir}/usr/share/licenses/
    cp Include/* ${pkgdir}/usr/include/mediahandling/
    cp LICENSE  ${pkgdir}/usr/share/licenses/mediahandling
}
