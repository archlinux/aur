# Maintainer: Jonathan Liu <net147@gmail.com>
# Contributer: N30N <archlinux@alunamation.com>
pkgname=djv
pkgver=1.1.0
pkgrel=2
pkgdesc="Movie playback and image processing software for the film and computer animation industries"
url="http://djv.sourceforge.net/"
license=('BSD')
arch=('i686' 'x86_64')
depends=("desktop-file-utils" "ffmpeg" "glew" "libjpeg" "libpng" "libquicktime" "libtiff" "openexr" "qt5-base")
makedepends=("cmake" "portaudio" "qt5-tools")
options=("!docs")
install="${pkgname}.install"
source=("git://git.code.sf.net/p/djv/git#commit=44a063755e627c70498d948478e29ffc1d3f105d"
        "ffmpeg.patch"
        "${pkgname}_view.desktop")
md5sums=('SKIP'
         '9c16feff49d2b8af12f18a8346288e9e'
         '2668ad2635036f33ba615b5dc538b1cf')

prepare() {
    cd git
    sed -i '/enable_testing()/d' CMakeLists.txt
    sed -i '/add_subdirectory(tests)/d' CMakeLists.txt
    sed -i 's/set(djvPackageThirdParty true)/set(djvPackageThirdParty false)/' CMakeLists.txt
    patch -Np1 -i "${srcdir}/ffmpeg.patch"
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
