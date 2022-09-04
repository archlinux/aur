pkgname=kms-elements
pkgver=6.17.0
pkgrel=1
pkgdesc="Kurento server media elements"
arch=(any)
url="https://github.com/Kurento/kms-elements"
license=(apache)
depends=(boost kms-core libnice gstreamer gst-plugins-base gst-plugins-bad)
makedepends=(kms-cmake-utils kurento-module-creator)
source=(
    "git+https://github.com/Kurento/$pkgname.git#tag=$pkgver"
    cmake-boost.patch
    kmselements.c.patch
    kmsrecorderendpoint.c.patch
    kmswebrtcendpoint.c.patch
)
sha256sums=(SKIP SKIP SKIP SKIP SKIP)

prepare() {
    cd "$srcdir/$pkgname"
    patch -p0 <"$srcdir/cmake-boost.patch"
    patch -p1 <"$srcdir/kmselements.c.patch"
    patch -p1 <"$srcdir/kmsrecorderendpoint.c.patch"
    patch -p1 <"$srcdir/kmswebrtcendpoint.c.patch"
    sed -ri -e 's#gstreamer((-[-a-z]+)?)-1\.5#gstreamer\1-1.0#g' {,*/,*/*/,*/*/*/,*/*/*/*/}CMakeLists.txt
}

build() {

    local builddir=$srcdir/$pkgname/build
    rm -rf "$builddir"
    mkdir "$builddir"
    cd "$builddir"
    cmake -DCMAKE_MODULES_INSTALL_DIR=/usr/share/cmake/Modules -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_SYSCONFDIR=/etc -DCMAKE_BUILD_TYPE=Release ..
    make
}

package() {
    local builddir=$srcdir/$pkgname/build
    cd "$builddir"
    make install DESTDIR="$pkgdir"
}
