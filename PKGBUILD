# Maintainer: taotieren <admin@taotieren.com>

pkgname=data-logging-service
_name=dls
pkgver=1.6.8
pkgrel=1
pkgdesc="The Data Logging Service (DLS) is a data logging system for EtherLab, that is capable of collecting, compressing and storing high-frequency realtime data. The goal is, to allow the user unlimited and performant access to the stored data."
arch=($CARCH)
url="https://gitlab.com/etherlab.org/dls"
license=('GPL-3.0-or-later')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
_qt=qt5
depends=(
    fftw
    fltk
    gcc-libs
    glibc
    hicolor-icon-theme
    hdf5
    libxml2
    pcre
    perl
    protobuf
    uriparser
    zlib
    $_qt-base
    $_qt-svg
    # AUR
    pdcom
)
makedepends=(
    git
    cmake
    ninja
    $_qt-tools
    #     doxygen
    systemd-libs
    pkgconf
)
backup=()
options=()
#install=${pkgname}.install
source=(
    "${_name}-${pkgver}.tar.gz::${url}/-/archive/${pkgver}/${_name}-${pkgver}.tar.gz")

sha256sums=('8c9aeada5b3cf167f8f7cdaaae6dff171a6e473ef3e2994146de89dc807bbf3b')

build() {
    cd "${srcdir}/${_name}-${pkgver}"

    echo ${pkgver} >revision
    cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev \
        -B build \
        -G Ninja

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${_name}-${pkgver}/build install
    mv -fv ${pkgdir}/usr/etc/* ${pkgdir}/etc/
    rm -rf ${pkgdir}/usr/etc
}
