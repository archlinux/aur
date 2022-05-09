# Maintainer: Wilken 'Akiko' Gottwalt <akiko@mailbox.org>

pkgname=nana
pkgver=1.7.4
pkgrel=2
pkgdesc="An opensource cross-platform GUI library written in modern C++11 for static linking"
arch=("i686" "x86_64")
url="http://nanapro.org/en-us/"
license=("custom:Boost Software License")
depends=("alsa-lib" "libjpeg-turbo" "libpng" "libx11" "libxft")
makedepends=("alsa-lib" "cmake" "libjpeg-turbo" "libpng" "libx11" "libxft" "xorgproto")
source=("https://sourceforge.net/projects/nanapro/files/Nana/Nana%201.x/nana_${pkgver}.zip"
        "fix_the_little_issues.patch"
        "fix_ignored_fread_png_value.patch")
sha256sums=('c5a2e3cf83a9c43a61262c25921ed793280d6d3afbf2ea65364e5dd42440176a'
            'fc49f8e342b1193e7eb36b83b82512b4e1250e58d23912b5a8b1a124944515c9'
            '87af9d37341b588c9f52193ee241211366122e95b4392098a849e22bb9736801')

prepare() {
    cd ${srcdir}/${pkgname}

    patch -Np1 -i ../fix_the_little_issues.patch
    patch -Np1 -i ../fix_ignored_fread_png_value.patch
}

build() {
    if [ ! -d "${srcdir}/${pkgname}_build_static" ]
    then
        mkdir ${srcdir}/${pkgname}_build_static
    fi
    cd ${srcdir}/${pkgname}_build_static
    cmake ../${pkgname} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DNANA_CMAKE_ENABLE_AUDIO=YES \
        -DNANA_CMAKE_ENABLE_JPEG=YES \
        -DNANA_CMAKE_ENABLE_PNG=YES \
        -DNANA_CMAKE_INSTALL=YES \
        -DNANA_CMAKE_NANA_FILESYSTEM_FORCE=NO \
        -DNANA_CMAKE_STD_FILESYSTEM_FORCE=YES \
        -DNANA_CMAKE_INSTALL=ON
    make

    if [ ! -d "${srcdir}/${pkgname}_build_shared" ]
    then
        mkdir ${srcdir}/${pkgname}_build_shared
    fi
    cd ${srcdir}/${pkgname}_build_shared
    cmake ../${pkgname} \
        -DBUILD_SHARED_LIBS=YES \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DNANA_CMAKE_ENABLE_AUDIO=YES \
        -DNANA_CMAKE_ENABLE_JPEG=YES \
        -DNANA_CMAKE_ENABLE_PNG=YES \
        -DNANA_CMAKE_INSTALL=YES \
        -DNANA_CMAKE_NANA_FILESYSTEM_FORCE=NO \
        -DNANA_CMAKE_STD_FILESYSTEM_FORCE=YES \
        -DNANA_CMAKE_INSTALL=ON
    make
}

package() {
    cd ${srcdir}/${pkgname}_build_shared
    make DESTDIR="${pkgdir}" install

    cp ${srcdir}/${pkgname}_build_static/libnana.a ${pkgdir}/usr/lib

    cd ${pkgdir}/usr/lib
    mv libnana.so libnana.so.${pkgver}
    ln -s libnana.so.${pkgver} libnana.so.1.7
    ln -s libnana.so.${pkgver} libnana.so.1
}
