# Maintainer: Jon Noble <jonnobleuk@gmail.com>
pkgname=mediahandling
pkgver=0.0.0
pkgrel=2
pkgdesc="A library solely intended for the use in the project Chestnut by handling all media-file operations"
arch=(x86_64)
url="https://github.com/jonno85uk/mediahandling"
license=('MIT')
depends=('ffmpeg')
makedepends=('cmake') 
provides=("${pkgname%}")
source=("https://github.com/jonno85uk/mediahandling/archive/0.0.0.tar.gz")
md5sums=('5a12d7ae37dcb60122bdf2a1a9c6b6e7')

prepare() {
    rm -rf "mediahandling"
    rm -rf ${pkgdir}
    tar xaf 0.0.0.tar.gz
    mv mediahandling-0.0.0 mediahandling
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
    # Temporary until CMakeLists.txt and api is updated
    mkdir -p ${pkgdir}/usr/include/mediahandling/
    cp Include/* ${pkgdir}/usr/include/mediahandling/
    cp ffmpeg/*.h ${pkgdir}/usr/include/mediahandling/
}
