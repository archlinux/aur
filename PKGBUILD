# Maintainer: Martin Horský <martin@horsky.me>
# Contributors: Aleksandr Matuzok <sherilynhope@gmail.com>, Patryk Jaworski <regalis@regalis.tech>, John Chen <john.chen@10gen.com>

pkgname=mongo-cxx-driver
pkgver=4.3.1
pkgrel=1
pkgdesc="C++ driver for MongoDB"
arch=('i686' 'x86_64')
url="http://mongocxx.org/"
license=("Apache-2.0")
depends=('mongo-c-driver>=2.3.0' glibc gcc-libs)
makedepends=(cmake gcc)
provides=(libbsoncxx libmongocxx)
conflicts=(libbsoncxx libmongocxx)
source=(https://github.com/mongodb/mongo-cxx-driver/releases/download/r${pkgver}/mongo-cxx-driver-r${pkgver}.tar.gz)
sha256sums=('39cbb5010b27eb00b4e947ad5e7d368acd966cd773834a10923d4f008f85b0a2')

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
