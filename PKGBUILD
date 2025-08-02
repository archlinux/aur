# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_basename=libdc1394
pkgname=lib32-libdc1394
pkgver=2.2.7
pkgrel=2
pkgdesc='Library to control IEEE 1394 based cameras (32 bit)'
arch=(x86_64)
license=(LGPL-2.1-or-later)
url='https://damien.douxchamps.net/ieee1394/libdc1394/'
depends=(
    lib32-glibc
    lib32-libraw1394
    lib32-libusb
    libdc1394)
makedepends=(
    git
    lib32-libxv
    lib32-sdl
)

source=("$_basename::git+https://git.code.sf.net/p/libdc1394/code#tag=V_${pkgver//./_}")
b2sums=(2e4c03c6f7c96734230e452e9088abcc54907eabd81eebb0862f192e2d1c3c6d3f65d92a75cc95323f9bf4d1490b52043bbb0c1776619cac8cace44306e354d2)

prepare() {
    cd $_basename

    autoreconf -fi
}


build() {
    cd $_basename

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    ./configure \
        --build=i686-pc-linux-gnu \
        --prefix=/usr \
        --libdir=/usr/lib32 \
        --sysconfdir=/etc \
        --localstatedir=/var

    make
}

package() {
    cd $_basename

    make DESTDIR="${pkgdir}" install

    rm -rf "${pkgdir}/usr"/{bin,include,share}
}
