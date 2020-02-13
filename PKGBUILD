# Maintainer: Wilken 'Akiko' Gottwalt <akiko@mailbox.org>

pkgname=nana
pkgver=1.7.3
pkgrel=1
pkgdesc="An opensource cross-platform GUI library written in modern C++11 for static linking"
arch=("i686" "x86_64")
url="http://nanapro.org/en-us/"
license=("custom:Boost Software License")
depends=("alsa-lib" "libjpeg-turbo" "libpng" "libx11" "libxft")
makedepends=("alsa-lib" "cmake" "libjpeg-turbo" "libpng" "libx11" "libxft" "xorgproto")
source=("https://sourceforge.net/projects/nanapro/files/Nana/Nana 1.x/nana_${pkgver}.zip"
        "fix_the_little_issues.patch")
sha256sums=('af69c2d570d32efdc386c5245cfcd05ebdde4e21c1459b229a78496d2609a9c3'
            '0a00b824b90b9380be9a4376507b0880fb75466b8114275156f2d3bd44c9f32b')

prepare() {
    cd ${srcdir}/${pkgname}

    patch -Np1 -i ../fix_the_little_issues.patch
}

build() {
    cd ${srcdir}/${pkgname}

    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DNANA_CMAKE_ENABLE_AUDIO=YES \
        -DNANA_CMAKE_ENABLE_JPEG=YES \
        -DNANA_CMAKE_ENABLE_PNG=YES \
        -DNANA_CMAKE_INSTALL=YES \
        -DNANA_CMAKE_NANA_FILESYSTEM_FORCE=NO \
        -DNANA_CMAKE_STD_FILESYSTEM_FORCE=YES
    make

    cmake \
        -DBUILD_SHARED_LIBS=YES \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DNANA_CMAKE_ENABLE_AUDIO=YES \
        -DNANA_CMAKE_ENABLE_JPEG=YES \
        -DNANA_CMAKE_ENABLE_PNG=YES \
        -DNANA_CMAKE_INSTALL=YES \
        -DNANA_CMAKE_NANA_FILESYSTEM_FORCE=NO \
        -DNANA_CMAKE_STD_FILESYSTEM_FORCE=YES
    make
}

package() {
    cd ${srcdir}/${pkgname}

    make DESTDIR="${pkgdir}" install
    cp ${srcdir}/${pkgname}/libnana.a ${pkgdir}/usr/lib

    cd ${pkgdir}/usr/lib
    mv libnana.so libnana.so.${pkgver}
    ln -s libnana.so.${pkgver} libnana.so.1.7
    ln -s libnana.so.${pkgver} libnana.so.1
}
