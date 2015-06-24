# Maintainer: zoe <chp321@gmail.com>
pkgname=symboleditor
pkgver=1.5.0
pkgrel=2
pkgdesc="Symbol editor for KXStitch"
arch=('i686' 'x86_64')
url="http://kxstitch.sourceforge.net/"
license=('GPL')
depends=('kdebase-runtime' 'imagemagick')
makedepends=('cmake' 'automoc4' 'doxygen' 'patch')
install=symboleditor.install
        
source=(http://www-ftp.lip6.fr/pub/X11/kde/stable/symboleditor/${pkgver}/src/SymbolEditor-${pkgver}-1.tar.bz2 symboleditor.install)
md5sums=('20f27055e5dd53e1dc4837d7e6f16b69' '5b554364ee8db32e0bb1e881bf0bca34')

build() {
    cd "$srcdir/SymbolEditor-$pkgver"
    rm -rf build
    mkdir build 
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .. \
        -DImageMagick_Magick++_INCLUDE_DIR:PATH=/usr/include/ImageMagick-6 \
        -DImageMagick_Magick++_LIBRARY:FILEPATH=/usr/lib/libMagick++-6.Q16.so \
        -DImageMagick_MagickCore_INCLUDE_DIR:PATH=/usr/include/ImageMagick-6 \
        -DImageMagick_MagickCore_LIBRARY:FILEPATH=/usr/lib/libMagickCore-6.Q16.so \
        -DCMAKE_CXX_FLAGS:STRING="-DMAGICKCORE_HDRI_ENABLE=0 -DMAGICKCORE_QUANTUM_DEPTH=16"
        # ^^^ workaround for broken cmake, remove once cmake is fixed
        #     see: https://bugs.archlinux.org/task/35280
    make
}
 
package() {
    cd "$srcdir/SymbolEditor-$pkgver/build"
    make DESTDIR="${pkgdir}" install
}
