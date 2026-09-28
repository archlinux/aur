# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgname=libopenshot
pkgver=1.0.1
pkgrel=1
pkgdesc="A video editing, animation, and playback library for C++, Python, and Ruby"
arch=('x86_64')
url="https://github.com/OpenShot/libopenshot"
license=('LGPL-3.0-or-later')
depends=('babl'
         'ffmpeg'
         'glib2'
         'glibc'
         'imagemagick'
         'jsoncpp'
         'libgcc'
         'libgomp'
         'libopenshot-audio'
         'libpipewire'
         'libstdc++'
         'opencv4'
         'protobuf'
         'python'
         'qt6-base'
         'qt6-svg'
         'resvg'
         'ruby')
makedepends=('catch2' 'cmake' 'doxygen' 'swig' 'vulkan-headers')
provides=('libopenshot.so')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "ffmpeg7-codec-capabilities.patch::${url}/pull/1088.patch")
sha512sums=('f790797dccdf173efdfbc50e8dea6a6d23ffa64af2c1b460ebd070fdd955c0f5c5bece549c1ba7ad3299c2e44287fe87caaba523eae5af14ae77c850e7005ace'
            '850a2f6585f49163b1bb1469a4114f23f3c5f1dfbe16c177186329ddabbf8b8861808d9ff7b05d36672b93a1ad6f6566f09a20dec1f2f1e349c2c593b6cb17f6')
b2sums=('5ad25cf34babd6297eca152fffd3943069223e0f4217e6b2dab76550461a63b070c365dac467c815c62c6aef0ff7177d9c46743fec661563822a875ec0819a11'
        'e382ffe72edbc048b1b22e3300c93f0448837c2ee42310508eb49d7eb01ec3176b86a5a91e841f6f428002fffd5cc560e203f874799e549b43df84582083a1f2')

prepare() {
    cd "${pkgname}-${pkgver}"
    patch -Np1 -i "${srcdir}/ffmpeg7-codec-capabilities.patch"
}

build() {
    local cmake_options=(
        -B build
        -S "${pkgname}-${pkgver}"
        -D CMAKE_BUILD_TYPE=Release
        -D CMAKE_INSTALL_PREFIX=/usr
        -D USE_QT6=ON
        -W no-author
    )
    export CXXFLAGS+=" -I/usr/include/opencv4"
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
