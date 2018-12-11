# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: orumin <dev at orum.in>

_basename=libgphoto2
pkgname=lib32-libgphoto2
pkgver=2.5.20
pkgrel=1
pkgdesc="The core library of gphoto2, designed to allow access to digital camera by external programs. (32-bit)"
url="http://www.gphoto.org/"
arch=(x86_64)
license=(LGPL)
depends=(lib32-libexif lib32-libjpeg lib32-gd lib32-libltdl lib32-libusb lib32-libxml2 libgphoto2)
makedepends=(autoconf-archive git)
_commit=cd64b9165294738042f2cb8d85349b792f86a0db  # tags/libgphoto2-2_5_20-release
source=("git+https://github.com/gphoto/libgphoto2#commit=$_commit")
sha256sums=('SKIP')
validpgpkeys=('7C4AFD61D8AAE7570796A5172209D6902F969C95') # Marcus Meissner

pkgver() {
    cd $_basename

    git describe --tags | sed 's/^libgphoto2-//;s/-release//;s/_/./g;s/-/+/g'
}

prepare() {
    cd $_basename

    autoreconf -fvi
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
        --disable-rpath

    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool

    make
}

package() {
    cd $_basename

    make DESTDIR="$pkgdir" install

    rm -r "$pkgdir"/usr/bin
    rm -r "$pkgdir"/usr/include
    rm -r "$pkgdir"/usr/share

    # Remove unused udev helper
    rm -r "$pkgdir/usr/lib32/udev"
}

