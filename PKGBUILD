# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_basename=libdvdnav
pkgname=lib32-libdvdnav
pkgver=6.0.1
pkgrel=1
pkgdesc="The library for xine-dvdnav plugin (32 bit)"
arch=(x86_64)
license=(GPL)
url="https://www.videolan.org/developers/libdvdnav.html"
depends=(lib32-libdvdread libdvdnav)
makedepends=(git)
_commit=ee4f6486d73ab54e7704b4fed2615a1bad76427f  # tags/6.0.1^0
source=("git+https://code.videolan.org/videolan/libdvdnav.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
    cd "${_basename}"

    git describe --tags | sed -e 's/-/+/g'
}

prepare() {
    cd "${_basename}"

    autoreconf -fi
}

build() {
    cd "${_basename}"

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    ./configure \
        --build=i686-pc-linux-gnu \
        --prefix=/usr \
        --libdir=/usr/lib32

    make
}

package() {
    cd "${_basename}"

    make DESTDIR="${pkgdir}" install

    rm -rf "${pkgdir}/usr"/{include,share}
}

