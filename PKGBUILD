# Maintainer: KroshKobel <kroshkobel AT gmail DOT com>

pkgname=coolreader3-git
pkgver=r4097.1e07d15
pkgrel=3
pkgdesc="E-book reader for Linux"
arch=("i686" "x86_64")
url="http://sourceforge.net/projects/crengine/"
license=("GPL2")
depends=("zlib" "libpng" "libjpeg" "freetype2" "qt4")
makedepends=("git" "cmake")
provides=("coolreader3")
conflicts=("coolreader3")
install="${pkgname}.install"
source=("${pkgname}::git://git.code.sf.net/p/crengine/crengine" "use_freetype2.patch" "config_saving_fix.patch" "freetype2_path_fix.patch")
md5sums=("SKIP" "390a7e6a9a1bb7ef2723176e276bd524" "262b3b926956473d3cbb45602485e897" "d0c80482b6712c8211f9ac4423c37d6a")

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname}"
    patch -Np1 -i "${srcdir}/use_freetype2.patch"
    patch -Np1 -i "${srcdir}/config_saving_fix.patch"
    patch -Np1 -i "${srcdir}/freetype2_path_fix.patch"
}

build() {
    cd "${srcdir}/${pkgname}"
    
    mkdir build
    cd build
    
    cmake -DGUI=QT -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd "${srcdir}/${pkgname}/build"
    make DESTDIR="${pkgdir}" install
}