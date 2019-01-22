# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=gupnp
pkgname=lib32-gupnp
pkgver=1.0.3
pkgrel=1
pkgdesc="An object-oriented UPNP framework (32-bit)"
arch=(x86_64)
url="https://wiki.gnome.org/Projects/GUPnP"
license=(LGPL)
depends=(lib32-gssdp gupnp)
makedepends=(autoconf-archive git gobject-introspection vala)
_commit=0e4f31cfc489a2c21f052885695902ae5ba98c8a  # tags/gupnp-1.0.3^0
source=("git+https://gitlab.gnome.org/GNOME/gupnp.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
    cd $_basename

    git describe --tags | sed 's/^gupnp-//;s/-/+/g'
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
        --sysconfdir=/etc \
        --localstatedir=/var \
        --libdir=/usr/lib32 \
        --with-context-manager=linux \
        --enable-compile-warnings=minimum \
        --disable-debug \
        --disable-static \
        --disable-gtk-doc

    make
}

check() {
    cd $_basename

    make check
}

package() {
    cd $_basename

    make DESTDIR="$pkgdir" install

    cd "$pkgdir/usr"

    rm -r bin include share
}
