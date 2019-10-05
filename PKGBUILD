# Maintainer: Wilken 'Akiko' Gottwalt <akiko@mailbox.org>

pkgname=nana
pkgver=1.7.2
pkgrel=1
pkgdesc="An opensource cross-platform GUI library written in modern C++11 for static linking"
arch=("i686" "x86_64")
url="http://nanapro.org/en-us/"
license=("custom:Boost Software License")
depends=("alsa-lib" "libjpeg-turbo" "libpng" "libx11" "libxft")
makedepends=("alsa-lib" "cmake" "libjpeg-turbo" "libpng" "libx11" "libxft" "xorgproto")
source=("https://sourceforge.net/projects/nanapro/files/Nana/Nana 1.x/nana_${pkgver}.zip"
        "fix_all_the_little_issues.patch")
sha256sums=('442b0e0ad899792bb97dd5b3aed0cb3d36b62fb2e0564b28604b5bcb228960c3'
            '0033bdd672a2acfb8fe785b15de27e8e89fc843f94340bcde814e631477e3239')

prepare() {
    cd ${srcdir}/${pkgname}

    patch -Np1 -i ../fix_all_the_little_issues.patch
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
        -DNANA_CMAKE_NANA_FILESYSTEM_FORCE=YES
    make

    cmake \
        -DBUILD_SHARED_LIBS=YES \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DNANA_CMAKE_ENABLE_AUDIO=YES \
        -DNANA_CMAKE_ENABLE_JPEG=YES \
        -DNANA_CMAKE_ENABLE_PNG=YES \
        -DNANA_CMAKE_INSTALL=YES \
        -DNANA_CMAKE_NANA_FILESYSTEM_FORCE=YES
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
