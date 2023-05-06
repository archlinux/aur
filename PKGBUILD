# Maintainer: taotieren <admin@taotieren.com>

pkgbase=nanomq-git
pkgname=(nanomq{,-sqlite,-msquic,-full}-git)
pkgver=0.17.8.r72.g98e0e2f2
pkgrel=1
pkgdesc="Nano MQTT Broker - An Ultra-light and Blazing-fast MQTT Broker for IoT Edge"
arch=('any')
url="https://github.com/nanomq/nanomq"
license=('MIT')
provides=(nanonng
        nng)
conflicts=(${pkgname%-git})
depends=(mbedtls)
makedepends=(git
            cmake
            gcc
            ninja)
backup=()
options=('!strip')
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgbase%-git}/"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${pkgbase%-git}/"
    git submodule update --init --recursive
}

package_nanomq-git() {
    pkgdesc+="(Broker)"
    provides+=(${pkgname%-git})
    depends+=()

    cd "${srcdir}/${pkgbase%-git}/"
    cmake -DCMAKE_BUILD_TYPE=None \
          -DNNG_ENABLE_TLS=ON \
          -DCFG_METHOD=CMAKE_CONFIG -DNOLOG=0 \
          -DCFG_METHOD=CMAKE_CONFIG -DMQ=1 \
          -DBUILD_SHARED_LIBS=ON \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -B build_nanomq \
          -G Ninja

    ninja -C build_nanomq

    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgbase%-git}/build_nanomq install
}

package_nanomq-sqlite-git() {
    pkgdesc+="(sqlite Broker)"
    provides+=(${pkgname%-git})
    depends+=(sqlite)

    cd "${srcdir}/${pkgbase%-git}/"
    cmake -DCMAKE_BUILD_TYPE=None \
          -DNNG_ENABLE_TLS=ON \
          -DNNG_ENABLE_SQLITE=ON \
          -DCFG_METHOD=CMAKE_CONFIG -DNOLOG=0 \
          -DCFG_METHOD=CMAKE_CONFIG -DMQ=1 \
          -DBUILD_SHARED_LIBS=ON \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -B build_nanomq-sqlite \
          -G Ninja

    ninja -C build_nanomq-sqlite

    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgbase%-git}/build_nanomq-sqlite install
}

package_nanomq-msquic-git() {
    pkgdesc+="(msquic Broker)"
    provides+=(${pkgname%-git}
            msquic)
    depends+=(sqlite)

    cd "${srcdir}/${pkgbase%-git}/"
    cmake -DCMAKE_BUILD_TYPE=None \
          -DNNG_ENABLE_TLS=ON \
          -DNNG_ENABLE_QUIC=ON \
          -DNNG_ENABLE_SQLITE=ON \
          -DQUIC_BUILD_SHARED=OFF \
          -DCFG_METHOD=CMAKE_CONFIG -DNOLOG=0 \
          -DCFG_METHOD=CMAKE_CONFIG -DMQ=1 \
          -DBUILD_SHARED_LIBS=ON \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -B build_nanomq-msquic \
          -G Ninja

    ninja -C build_nanomq-msquic

    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgbase%-git}/build_nanomq-msquic install
}

package_nanomq-full-git() {
    pkgdesc+="(full Broker)"
    provides+=(${pkgname%-git}
                msquic)
    depends+=(sqlite
            zeromq)

    cd "${srcdir}/${pkgbase%-git}/"
    cmake -DCMAKE_BUILD_TYPE=None \
          -DNNG_ENABLE_TLS=ON \
          -DNNG_ENABLE_SQLITE=ON \
          -DNNG_ENABLE_QUIC=ON \
          -DNNG_ENABLE_SQLITE=ON \
          -DQUIC_BUILD_SHARED=OFF \
          -DENABLE_JWT=ON \
          -DBUILD_ZMQ_GATEWAY=ON \
          -DBUILD_BENCH=ON \
          -DCFG_METHOD=CMAKE_CONFIG -DNOLOG=0 \
          -DCFG_METHOD=CMAKE_CONFIG -DMQ=1 \
          -DBUILD_SHARED_LIBS=ON \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -B build_nanomq-full \
          -G Ninja
#           -DBUILD_DDS_PROXY=ON \

    ninja -C build_nanomq-full

    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgbase%-git}/build_nanomq-full install
}


