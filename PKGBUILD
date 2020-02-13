# Maintainer: Dāvis Mosāns <davispuh at gmail dot com>

_pkgname=virtualgl
pkgname=$_pkgname-git
pkgver=2.4.r399.g2a7fadbc
pkgrel=1
pkgdesc='Redirects 3D commands from an OpenGL application onto a server-side 3D graphics card'
arch=('i686' 'x86_64')
url='http://www.virtualgl.org/'
license=('LGPL')
depends=('libxv' 'glu' 'libjpeg-turbo' 'xcb-util-keysyms')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/VirtualGL/virtualgl.git#branch=dev" "fix_mesa_change.patch")
sha256sums=('SKIP' '38ef2efcf973f42855c7e5260d758904d06c8a04d29c6e43e9f07620977535b4')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir"
    mkdir -p build
    cd "virtualgl"
    patch -p1 < ./../fix_mesa_change.patch
}

build() {
    cd "$srcdir/build"

    cmake "$srcdir/$_pkgname" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DTJPEG_INCLUDE_DIR=/usr/include \
        -DTJPEG_LIBRARY=/usr/lib/libturbojpeg.so

    make
}

package() {
    cd "$srcdir/build"

    make install DESTDIR="$pkgdir"

    mv "$pkgdir"/usr/bin/glxinfo "$pkgdir"/usr/bin/vglxinfo
    mv "$pkgdir"/usr/lib64 "$pkgdir"/usr/lib
}

