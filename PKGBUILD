# Maintainer: Martin Horský <martin@horsky.me>
# Contributors: Aleksandr Matuzok <sherilynhope@gmail.com>, Patryk Jaworski <regalis@regalis.tech>, John Chen <john.chen@10gen.com>

pkgname=mongo-cxx-driver
pkgver=3.10.1
pkgrel=1
pkgdesc="C++ driver for MongoDB"
arch=('i686' 'x86_64')
url="http://mongocxx.org/"
license=("Apache-2.0")
depends=('mongo-c-driver>=1.25.0')
makedepends=(cmake gcc 'mongo-c-driver>=1.25.0' 'boost>=1.56.0')
provides=(libbsoncxx libmongocxx)
conflicts=(libbsoncxx libmongocxx)
source=(https://github.com/mongodb/mongo-cxx-driver/releases/download/r${pkgver}/mongo-cxx-driver-r${pkgver}.tar.gz)
sha256sums=('0297d9d1a513f09438cc05254b14baa49edd1fa64a6ce5d7a80a1eb7677cf2be')

build() {
    if [ -z "$CMAKE_GENERATOR" ]; then
        export CMAKE_GENERATOR=Ninja
    fi
    cd "${pkgname}-r$pkgver/build/"
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr/ \
        -DCMAKE_CXX_STANDARD=17 \
        -DBSONCXX_POLY_USE_BOOST=0 \
        -DENABLE_UNINSTALL=0 \
        -DENABLE_TESTS=0 \
        ../
    cmake \
        --build . \
        -j "$nproc"
}

package() {
    cd "${pkgname}-r$pkgver/build/"
    cmake \
        --install . \
        --prefix "$pkgdir/usr"
}
