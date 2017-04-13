# Maintainer: kikadf <kikadf.01@gmail.com>

pkgname=mir
pkgver=0.26.2
pkgrel=1
pkgdesc="Ubuntu's display server"
url="https://launchpad.net/mir"
arch=('x86_64')
license=('GPL' 'LGPL' 'BSD' 'Apache')
depends=('boost' 'libglvnd' 'protobuf-mir' 'capnproto' 'google-glog' 'gflags' 'glib2' \
         'nettle' 'libinput-mir' 'udev' 'libxkbcommon' 'freetype2' 'abi-compliance-checker' \
         'lttng-ust')
makedepends=('extra-cmake-modules' 'glm' 'doxygen' 'libdrm')
source=("https://launchpad.net/mir/0.26/$pkgver/+download/$pkgname-$pkgver.tar.xz"
        "https://raw.githubusercontent.com/sandstorm-io/capnproto/master/c%2B%2B/cmake/FindCapnProto.cmake")
md5sums=('3c85ee4798ba6929f568c758fad18192'
         '16e3a086ca0afe4eb71771da72c5e406')

prepare() {
    cd $pkgname-$pkgver
    rm -rf build cmake/FindCapnProto.cmake
    cp ../FindCapnProto.cmake cmake/
    mkdir build
    sed -i 's|#include <drm/drm.h>|#include <libdrm/drm.h>|' src/platforms/mesa/server/kms/cursor.cpp
}

build() {
    CXXFLAGS="${CXXFLAGS} -Wno-error=missing-field-initializers"
    cd $pkgname-$pkgver/build
    cmake .. -DMIR_PLATFORM='mesa-kms;mesa-x11' \
             -DCMAKE_BUILD_TYPE=Release \
             -DCMAKE_INSTALL_PREFIX=/usr \
             -DCMAKE_INSTALL_LIBDIR=/usr/lib \
             -DMIR_ENABLE_TESTS=NO
    make -j2
}

package() {
    cd $pkgname-$pkgver/build
    make DESTDIR="${pkgdir}/" install
    mv ${pkgdir}/usr/usr/lib/mir/server-platform ${pkgdir}/usr/lib/mir/
    rm -rf ${pkgdir}/usr/usr
}
