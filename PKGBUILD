# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_basename=libdvdnav
pkgname=lib32-libdvdnav
pkgver=6.0.0
pkgrel=2
pkgdesc="The library for xine-dvdnav plugin (32 bit)"
arch=(x86_64)
license=(GPL)
url="https://www.videolan.org/developers/libdvdnav.html"
depends=(lib32-libdvdread libdvdnav)
makedepends=('git')
_commit=dcb9109e45ccd304ec82a7c7bf46cca63620adf9  # tags/6.0.0^0
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

