# Maintainer: zoe <chp321@gmail.com>
pkgname=kxstitch
pkgver=1.3.0
pkgrel=1
pkgdesc="The program that lets you create cross stitch patterns and charts."
arch=('i686' 'x86_64')
depends=('kdebase-runtime' 'imagemagick')
makedepends=('cmake' 'automoc4' 'doxygen' 'patch')
url="https://userbase.kde.org/KXStitch"
license=('GPL')
source=("http://download.kde.org/stable/${pkgname}/${pkgver}/src/${pkgname}-${pkgver}.tar.bz2" 'kxstitch.install')
md5sums=('6e7934065961646867a24004196693b0' '5b554364ee8db32e0bb1e881bf0bca34')
install=kxstitch.install

build() {
    cd "${srcdir}/kxstitch-${pkgver}"
    sed -i 's/-DMAGICKCORE_HDRI_ENABLE=0/-DMAGICKCORE_HDRI_ENABLE=1/' CMakeLists.txt
    
    # Avoid bug in cmake :
    sed -i '5i\cmake_policy(SET CMP0002 OLD)' CMakeLists.txt
   
    rm -rf build
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .. \
          -DCMAKE_BUILD_TYPE="Release"
    make
}

package() {
    cd "${srcdir}/kxstitch-${pkgver}/build"
    make DESTDIR="${pkgdir}" install

    # this one is unnecessary and namcap hates this dangling link
    #rm "${pkgdir}/usr/share/doc/kde/html/en/kxstitch/common"
}