# Maintainer: Wilken 'Akiko' Gottwalt <akiko@mailbox.org>

pkgname=nana
pkgver=1.7.0
pkgrel=1
pkgdesc="An opensource cross-platform GUI library written in modern C++11 for static linking"
arch=("i686" "x86_64")
url="http://nanapro.org/en-us/"
license=("custom:Boost Software License")
depends=("alsa-lib" "libjpeg-turbo" "libpng" "libx11" "libxft")
makedepends=("alsa-lib" "cmake" "libjpeg-turbo" "libpng" "libx11" "libxft" "xorgproto")
source=("https://sourceforge.net/projects/nanapro/files/Nana/Nana 1.x/nana 1.7.0.zip"
        "fix_all_the_little_issues.patch")
sha256sums=('b54b7754d702d5a3e27191645c5305a3769d14e830b9e96ecacf2d3c4801d2a1'
            'eb11ea2cd35c59522f54730513dae4089414fbf87bfc903408de6cf6fdf3942b')

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

    cp libnana.a "${pkgdir}"/
    cp libnana.so "${pkgdir}"/libnana.so.${pkgver}
    cd "${pkgdir}"
    ln -s libnana.so.${pkgver} libnana.so.1.7
    ln -s libnana.so.${pkgver} libnana.so.1
}
