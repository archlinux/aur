# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=libnice
pkgname=lib32-libnice
pkgver=0.1.14+70+gfb2f1f7
pkgrel=1
pkgdesc="An implementation of the IETF's draft ICE (for p2p UDP data streams) (32-bit)"
url="https://nice.freedesktop.org"
arch=(x86_64)
license=(LGPL)
depends=(lib32-gnutls lib32-gstreamer libnice)
makedepends=(git gtk-doc lib32-gstreamer)
_commit=fb2f1f77a31baa91968fc81c205f980b6913f403  # master
source=("git+https://anongit.freedesktop.org/git/libnice/libnice#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
    cd $_basename

    git describe --tags | sed 's/-/+/g'
}

prepare() {
    cd $_basename

    NOCONFIGURE=1 ./autogen.sh
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
        --with-gstreamer-0.10=no \
        --disable-gtk-doc-html \
        --disable-static \
        --enable-compile-warnings=maximum

    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd $_basename

    make DESTDIR="$pkgdir" install

    cd "$pkgdir"/usr

    rm -r bin include
}
