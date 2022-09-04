pkgname=kms-filters
pkgver=6.17.0
pkgrel=2
pkgdesc="Kurento server AV filters"
arch=(any)
url="https://github.com/Kurento/kms-filters"
license=(apache)
depends=(kms-core kms-elements opencv3-opt)
makedepends=(kms-cmake-utils kurento-module-creator)
source=(
    "git+https://github.com/Kurento/$pkgname.git#tag=$pkgver"
    cmake-opencv.patch
    facedetector.c.patch
    faceoverlay.c.patch
    imageoverlay.c.patch
    logooverlay.c.patch
    movementdetector.c.patch
    opencvfilter.c.patch
)
sha256sums=(SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP)

prepare() {
    cd "$srcdir/$pkgname"
    for p in "${source[@]:1}"; do
        patch -p1 <"$srcdir/$p"
    done
    sed -ri -e 's#gstreamer((-[-a-z]+)?)-1\.5#gstreamer\1-1.0#g' {,*/,*/*/,*/*/*/}CMakeLists.txt
    sed -ri -e 's#opencv_INCLUDE_DIRS#OpenCV_INCLUDE_DIRS#g' {,*/,*/*/,*/*/*/}CMakeLists.txt
    sed -ri -e 's#opencv_LIBRARIES#OpenCV_LIBRARIES#g' {,*/,*/*/,*/*/*/}CMakeLists.txt
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
