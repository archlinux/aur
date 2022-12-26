# Maintainer: Albert Sebastian <albertsebe2 at gmail dot com>
# Contributer: Dāvis Mosāns <davispuh at gmail dot com>

_pkgname=virtualgl
pkgname=$_pkgname-git
pkgver=3.1beta1.r6.g3979e912
pkgrel=1
pkgdesc='Redirects 3D commands from an OpenGL application onto a server-side 3D graphics card'
arch=('x86_64')
url='http://www.virtualgl.org/'
license=('LGPL')
depends=('libxv' 'glu' 'libjpeg-turbo' 'xcb-util-keysyms' 'opencl-driver' 'ocl-icd' 'xorg-xhost')
makedepends=('git' 'cmake' 'mesa' 'libxtst' 'opencl-headers' 'ninja' )
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/VirtualGL/virtualgl.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_pkgname"

    cmake \
      -GNinja \
      -Bbuild \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DTJPEG_INCLUDE_DIR=/usr/include \
      -DTJPEG_LIBRARY=/usr/lib/libturbojpeg.so \
      -DCMAKE_INSTALL_LIBDIR=/usr/lib \
      -DCMAKE_INSTALL_BINDIR=/usr/bin \
      -DCMAKE_INSTALL_DOCDIR=/usr/share/doc/${_pkgname} \
      -DVGL_FAKEXCB=1

    ninja -C build
}

package() {
    cd "$srcdir/$_pkgname"

    DESTDIR="$pkgdir" ninja -C build install

    mv "$pkgdir"/usr/bin/glxinfo "$pkgdir"/usr/bin/vglxinfo
    mv "$pkgdir"/usr/bin/eglinfo "$pkgdir"/usr/bin/veglinfo
}
