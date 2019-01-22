# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=gupnp-igd
pkgname=lib32-gupnp-igd
pkgver=0.2.5
pkgrel=1
pkgdesc="A library to handle UPnP IGD port mapping (32-bit)"
url="https://wiki.gnome.org/Projects/GUPnP"
arch=(x86_64)
license=(LGPL)
depends=(lib32-gupnp gupnp-igd)
makedepends=(git gnome-common gobject-introspection)
checkdepends=(python2-gobject)
_commit=5d9c48f3de6277b56c86e7131d84a1b24f30d819  # tags/0.2.5^0
source=("git+https://git.gnome.org/browse/gupnp-igd#commit=$_commit")
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
    export PYTHON=python2

    ./configure \
        --prefix=/usr \
        --build=i686-pc-linux-gnu \
        --libdir=/usr/lib32 \
        --disable-gtk-doc \
        --disable-python \
        --disable-static

    make
}

check() {
    cd $_basename

    make check
}

package() {
    cd $_basename

    make DESTDIR="${pkgdir}" install

    cd "$pkgdir/usr"

    rm -r include share
}

