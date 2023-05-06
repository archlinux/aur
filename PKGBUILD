# Maintainer: taotieren <admin@taotieren.com>

pkgname=nanonng-git
pkgver=0.17.8.r65.g2d4479ff
pkgrel=1
pkgdesc="The NNG submodule of NanoMQ"
arch=('any')
url="https://github.com/nanomq/NanoNNG"
license=('MIT')
provides=(${pkgname%-git}
         nng)
conflicts=(${pkgname%-git}
        nng)
depends=(mbedtls)
makedepends=(git
            cmake
            gcc
            ninja)
backup=()
options=('!strip')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}/"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}/"
    cmake -DCMAKE_BUILD_TYPE=None \
          -DNNG_ENABLE_TLS=ON \
          -DBUILD_SHARED_LIBS=ON \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -B build \
          -G Ninja

    ninja -C build
}

package() {
    cd "${srcdir}/${pkgname}/"
    DESTDIR="${pkgdir}" ninja -C build install
}
