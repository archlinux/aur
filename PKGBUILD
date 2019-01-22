# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=gssdp
pkgname=lib32-gssdp
pkgver=1.0.2
pkgrel=1
pkgdesc="A GObject-based API for handling resource discovery and announcement over SSDP (32-bit)"
arch=(x86_64)
url="http://gupnp.org/"
license=(LGPL)
depends=(lib32-libsoup)
makedepends=(autoconf-archive git gobject-introspection vala)
_commit=3dd02bdef0663caf0d6749b555c9b2b2ff1934cb  # tags/gssdp-1.0.2^0
source=("git+https://git.gnome.org/browse/gssdp#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
    cd $_basename

    git describe --tags | sed 's/^gssdp-//;s/-/+/g'
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
        --enable-compile-warnings=minimum \
        --disable-static \
        --disable-gtk-doc \
        --without-gtk

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

    rm -r include share
}
