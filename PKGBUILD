# Maintainer: Jonathan Liu <net147@gmail.com>
# Contributer: N30N <archlinux@alunamation.com>
pkgname=djv
pkgver=1.0.5
pkgrel=1
pkgdesc="Movie playback and image processing software for the film and computer animation industries"
url="http://djv.sourceforge.net/"
license=('BSD')
arch=('i686' 'x86_64')
depends=("desktop-file-utils" "ffmpeg" "glew" "libjpeg" "libpng" "libquicktime" "libtiff" "openexr" "qt5-base")
makedepends=("cmake" "portaudio" "qt5-tools")
options=("!docs")
install="${pkgname}.install"
source=("git://git.code.sf.net/p/djv/git#tag=${pkgver}"
        "libjpeg-boolean.patch"
        "openexr.patch"
        "${pkgname}_view.desktop")
md5sums=('SKIP'
         '1bd8936a1bdedfe102f62b4da0937ea3'
         '462c837569fe361ec795762208753930'
         '2668ad2635036f33ba615b5dc538b1cf')

prepare() {
    cd git
    patch -Np1 -i "${srcdir}/libjpeg-boolean.patch"
    patch -Np1 -i "${srcdir}/openexr.patch"
    sed -i '/enable_testing()/d' CMakeLists.txt
    sed -i '/add_subdirectory(tests)/d' CMakeLists.txt
    sed -i 's/set(djvPackageThirdParty true)/set(djvPackageThirdParty false)/' CMakeLists.txt
}

build() {
    [[ -d build ]] && rm -r build
    mkdir build && cd build
    cmake -D CMAKE_INSTALL_PREFIX:PATH=/usr ../git
    make
}

package() {
    cd build
    make DESTDIR=${pkgdir} install
    install -D -m644 {"${srcdir}","${pkgdir}/usr/share/applications"}/"${pkgname}_view.desktop"
    install -D -m644 "${srcdir}/git/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 "${srcdir}/git/lib/djvViewLib/images/projector32x32.png" "${pkgdir}/usr/share/pixmaps/djv_view.png"
}

# vim:set ts=2 sw=2 et:
