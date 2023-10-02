# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: orumin <dev at orum.in>

_basename=libgphoto2
pkgname=lib32-libgphoto2
pkgver=2.5.31
pkgrel=1
pkgdesc="Digital camera access library (32-bit)"
url="http://www.gphoto.org/"
arch=(x86_64)
license=(LGPL)
depends=(curl lib32-libexif lib32-gd lib32-libltdl lib32-libusb lib32-libxml2 libgphoto2)
makedepends=(autoconf-archive git)
_commit=ba28af2d22fd4cb7fa76a8ff569ba498e8021db5  # tags/libgphoto2-2_5_31-release
source=("git+https://github.com/gphoto/libgphoto2#commit=$_commit")
sha256sums=('SKIP')
validpgpkeys=('7C4AFD61D8AAE7570796A5172209D6902F969C95') # Marcus Meissner

pkgver() {
    cd $_basename

    git describe --tags | sed 's/^libgphoto2-//;s/-release//;s/^v//;s/_/./g;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
    cd $_basename

    autoreconf -fvi
}

build() {
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    local configure_options=(
        --build=i686-pc-linux-gnu
        --prefix=/usr
        --libdir=/usr/lib32
        --sysconfdir=/etc
        --localstatedir=/var
        --disable-rpath
    )

    cd $_basename

    ./configure "${configure_options[@]}"

    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd $_basename

    make DESTDIR="$pkgdir" install

    rm -r "$pkgdir"/usr/bin
    rm -r "$pkgdir"/usr/include
    rm -r "$pkgdir"/usr/share

    # Remove unused udev helper
    rm -rv "$pkgdir/usr/lib32/udev"
}

