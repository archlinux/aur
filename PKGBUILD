# Contributor: chip_exe
# https://aur.archlinux.org/packages/openxray-git/
# <openxray@yahoo.com>
pkgname=openxray-git
pkgver=1.6.02_1144
pkgrel=1 
pkgdesc="Unofficial X-Ray Engine port for Linux from the OpenXRay team (originally developed by GSC Game World)"
arch=('x86_64')
url="https://github.com/OpenXRay/xray-16"
license=('custom:Custom 3-сlause BSD')
install="info.install"
makedepends=(gcc git cmake libglvnd libjpeg6-turbo ncurses pcre2 pcre)
depends=(glew sdl2 openal crypto++ liblockfile freeimage libogg libtheora libvorbis lzo lzop libjpeg-turbo)
conflicts=(openxray openxray-dev)
source=(xray-16::git+https://github.com/OpenXRay/xray-16.git#branch=dev)
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/xray-16"
    printf 1.6.02_1144_"$(git rev-parse --short HEAD)"
}

prepare(){
    cd "$srcdir/xray-16"
    git submodule init
    git submodule update
}

build() {
    cd "$srcdir/xray-16"
    rm -fr bin
    mkdir "$srcdir/xray-16/bin"
    cd "$srcdir/xray-16/bin"
    cmake .. -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
#        -DCMAKE_BUILD_TYPE=Debug
#        -DMEMORY_ALLOCATOR=standard
    make
}

package() {
    cd "$srcdir/xray-16/bin"
    make DESTDIR="${pkgdir}/" install
    rm -rf "${pkgdir}/usr/lib/mimalloc-1.6"
    mkdir -p "${pkgdir}/usr/share/licenses/$pkgname/"
    cp "$srcdir/xray-16/License.txt" "${pkgdir}/usr/share/licenses/$pkgname/"
}
