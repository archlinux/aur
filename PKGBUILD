# Maintainer: zoe <chp321@gmail.com>
# Contributor : enckse <enckse [at] gmail [dot] com>
pkgname=kxstitch
pkgver=2.1.1
pkgrel=7
pkgdesc="The program that lets you create cross stitch patterns and charts."
arch=('i686' 'x86_64')
depends=('plasma-workspace' 'imagemagick>=7.0.0')
makedepends=('cmake' 'doxygen' 'patch' 'extra-cmake-modules' 'kdoctools' 'libmagick>=7.0.0')
url="https://userbase.kde.org/KXStitch"
license=('GPL')
source=("https://download.kde.org/stable/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.xz"
       "${pkgname}.install"
       "qt5.11.patch::https://cgit.kde.org/kxstitch.git/patch/?id=ca0f451dceecadc696ba6777084f22ceb5d372f0"
       "imagemagick7.patch")
sha1sums=('6f712bca3173b90149b67640fb1b63d02725c9ef'
          '8e58ce0776eff7ef29394a2f7a089191a4af0b1d'
          'd1a904efd34eca16d839d6d54356cb01abaa15a7'
          '59dc498eb3e555b0f85a717f0588b3a217f8cbbb')
install=${pkgname}.install

build() {
    cd "${srcdir}/kxstitch-${pkgver}"
    cp ../*.patch .
    patch -p1 < qt5.11.patch
    patch -p1 < imagemagick7.patch
    rm -rf build
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=`qtpaths --install-prefix` .. \
          -DImageMagick_Magick++_INCLUDE_DIRS=/usr/include/ImageMagick-7 \
          -DImageMagick_Magick++_LIBRARY=/usr/lib/libMagick++-7.Q16HDRI.so \
          -DImageMagick_MagickCore_LIBRARY=/usr/lib/libMagickCore-7.Q16HDRI.so \
          -DCMAKE_BUILD_TYPE="Release"
    make
}


package() {
    cd "${srcdir}/kxstitch-${pkgver}/build"
    make DESTDIR="${pkgdir}" install
}
