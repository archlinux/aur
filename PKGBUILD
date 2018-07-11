# Maintainer: Dana Sorensen <dana.r.sorensen@gmail.com>
# Contributor: Emmanuel Gil Peyrot <emmanuel.peyrot@collabora.com>

_pkgname=libiio
pkgname="$_pkgname-git"
pkgver=v0.15.r0.g6ecff5d
pkgrel=1
pkgdesc="Library for interfacing with IIO devices"
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="https://github.com/analogdevicesinc/libiio"
license=('LGPL2.1')
provides=('libiio')
conflicts=('libiio')
depends=('libusb' 'libaio' 'libxml2' 'libserialport' 'avahi' 'python')
makedepends=('git' 'cmake')
source=("$_pkgname::git+https://github.com/analogdevicesinc/libiio")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    mkdir -p "$srcdir/$_pkgname/build"
}

build() {
    cd "$srcdir/$_pkgname/build"
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_SBINDIR=bin \
        -DUDEV_RULES_INSTALL_DIR=/usr/lib/udev/rules.d \
        -DCSHARP_BINDINGS=OFF \
        -DMATLAB_BINDINGS=OFF \
        -DWITH_SYSTEMD=YES \
        -DSYSTEMD_UNIT_INSTALL_DIR=/usr/lib/systemd/system
    make
}

package() {
    cd "$srcdir/$_pkgname/build"
    make DESTDIR="$pkgdir" install
}

