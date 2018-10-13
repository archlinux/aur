# Maintainer: zoe <chp321@gmail.com>
# Contributor : enckse <enckse [at] gmail [dot] com>
pkgname=kxstitch
pkgver=2.1.1
pkgrel=9
pkgdesc="The program that lets you create cross stitch patterns and charts."
arch=('i686' 'x86_64')
depends=('plasma-workspace' 'libmagick')
makedepends=('cmake' 'doxygen' 'extra-cmake-modules' 'kdoctools')
url="https://userbase.kde.org/KXStitch"
license=('GPL')
_patches="https://cgit.kde.org/kxstitch.git/patch/?id="
source=("https://download.kde.org/stable/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.xz"
       "${pkgname}.install"
       "qt5.11.patch::${_patches}ca0f451dceecadc696ba6777084f22ceb5d372f0"
       "imagemagick7.patch"
       "color-find.patch::${_patches}26f7fce0508a149aefb9e9256f682abe87211760")
sha1sums=('6f712bca3173b90149b67640fb1b63d02725c9ef'
          '8e58ce0776eff7ef29394a2f7a089191a4af0b1d'
          'd1a904efd34eca16d839d6d54356cb01abaa15a7'
          '59dc498eb3e555b0f85a717f0588b3a217f8cbbb'
          '04bb2d31e235da33df2853242d32ce43005cf1c7')
install=${pkgname}.install

build() {
    cd "${srcdir}/kxstitch-${pkgver}"
    cp ../*.patch .
    patch -p1 < qt5.11.patch
    patch -p1 < imagemagick7.patch
    patch -p1 < color-find.patch
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
