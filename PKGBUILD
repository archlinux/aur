# Maintainer: zaps166 <spaz16 at wp dot pl>

pkgname=qdre-viewer-git
pkgver=0.0.0.r59.g332d59b
pkgrel=1
pkgdesc='Lightweight Qt image viewer'
arch=('x86_64')
url='https://gitlab.com/zaps166/qdre'
license=('MIT')
groups=('qdre')
depends=('qt5-base' 'qt5-x11extras' 'glib2' 'libxcb' 'gnome-menus' 'exiv2' 'kwindowsystem')
makedepends=('cmake' 'git')
conflicts=('qdre-git')
source=("git+https://gitlab.com/zaps166/qdre.git#branch=master")
sha1sums=('SKIP')

prepare() {
    mkdir -p build
}

pkgver() {
    cd qdre
    echo -n "0.0.0.r$(git rev-list --all --count).g$(git rev-parse --short HEAD)"
}

build() {
    cd build
    cmake ../qdre \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE=Release \
        -DQDRE_LIB_STATIC=ON \
        -DAPPS_QDRE_Compositor=OFF
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
    rm "${pkgdir}/usr/bin/qdre-gio-launch"
    rm "${pkgdir}/usr/share/pixmaps/qdre.svg"
    rm "${pkgdir}/usr/share/glib-2.0/schemas/org.qdre.gio.gschema.xml"
    rm -r "${pkgdir}/usr/include"
    rm -r "${pkgdir}/usr/lib"
}
