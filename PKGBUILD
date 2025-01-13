# Maintainer: Martin Horský <martin@horsky.me>
# Contributors: Aleksandr Matuzok <sherilynhope@gmail.com>, Patryk Jaworski <regalis@regalis.tech>, John Chen <john.chen@10gen.com>

pkgname=mongo-cxx-driver
pkgver=4.0.0
pkgrel=1
pkgdesc="C++ driver for MongoDB"
arch=('i686' 'x86_64')
url="http://mongocxx.org/"
license=("Apache-2.0")
depends=('mongo-c-driver>=1.27.0' glibc gcc-libs)
makedepends=(cmake gcc)
provides=(libbsoncxx libmongocxx)
conflicts=(libbsoncxx libmongocxx)
source=(https://github.com/mongodb/mongo-cxx-driver/releases/download/r${pkgver}/mongo-cxx-driver-r${pkgver}.tar.gz)
sha256sums=('d8a254bde203d0fe2df14243ef2c3bab7f12381dc9206d0c1b450f6ae02da7cf')

build() {
    if [ -z "$CMAKE_GENERATOR" ]; then
        export CMAKE_GENERATOR=Ninja
    fi
    cd "${pkgname}-r$pkgver/build/"
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr/ \
        -DCMAKE_CXX_STANDARD=17 \
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
