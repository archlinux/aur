# Maintainer: taotieren <admin@taotieren.com>

pkgname=nanomq-git
pkgver=0.17.8.r71.g9833011d
pkgrel=1
pkgdesc="Nano MQTT Broker - An Ultra-light and Blazing-fast MQTT Broker for IoT Edge"
arch=('any')
url="https://github.com/nanomq/nanomq"
license=('MIT')
provides=(${pkgname%-git}
        nanomq_cli
        nanonng
        nng
        mbedtls
        msquic)
conflicts=(${pkgname%-git})
depends=()
makedepends=(git
            cmake
            ninja)
backup=()
options=('!strip')
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}/"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${pkgname%-git}/"
    git submodule update --init --recursive
}

build() {
    cd "${srcdir}/${pkgname%-git}/"
    cmake -DCMAKE_BUILD_TYPE=None \
          -DNNG_ENABLE_QUIC=ON \
          -DNNG_ENABLE_TLS=ON \
          -DBUILD_CLIENT=ON \
          -DCFG_METHOD=CMAKE_CONFIG -DMQ=0 \
          -DBUILD_BENCH=ON \
          -DENABLE_JWT=ON \
          -DNNG_ENABLE_SQLITE=ON \
          -DBUILD_STATIC_LIB=ON \
          -DBUILD_SHARED_LIBS=ON \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -B build \
          -G Ninja
#           -DBUILD_DDS_PROXY=ON \
#          -DBUILD_ZMQ_GATEWAY=ON \
    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname%-git}/build install
}
