# Maintainer:
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgname=libopenshot
pkgver=1.0.0
pkgrel=1
pkgdesc="A video editing, animation, and playback library for C++, Python, and Ruby"
arch=('x86_64')
url="https://github.com/OpenShot/libopenshot"
license=('LGPL-3.0-or-later')
depends=('babl'
         'ffmpeg'
         'glibc'
         'imagemagick'
         'jsoncpp'
         'libgcc'
         'libgomp'
         'libopenshot-audio'
         'libstdc++'
         'opencv4'
         'protobuf'
         'python'
         'qt6-base'
         'qt6-svg'
         'resvg'
         'ruby'
         'zeromq')
makedepends=('catch2' 'cmake' 'cppzmq' 'doxygen' 'swig' 'vulkan-headers')
provides=('libopenshot.so')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "ffmpeg7-codec-capabilities.patch::${url}/pull/1088.patch")
sha512sums=('9a3e853a3e97715e2e329a8abc05acb9cab37bd540ce5c4d46852b49fb999a494ae05b280de19ea2fc8b655ddfa3b7a44653c7e7c4edd289d074c1eac2d7e12e'
            '850a2f6585f49163b1bb1469a4114f23f3c5f1dfbe16c177186329ddabbf8b8861808d9ff7b05d36672b93a1ad6f6566f09a20dec1f2f1e349c2c593b6cb17f6')
b2sums=('6bdb7f60424d92376e5a015f0619f808ea0353ecbb6bc2a3036f6a79cb8f455bb1c78203b85a4aa0a0bee858aa6814b8fe15c176beba5fc4c26a699d14f1a8f8'
        'e382ffe72edbc048b1b22e3300c93f0448837c2ee42310508eb49d7eb01ec3176b86a5a91e841f6f428002fffd5cc560e203f874799e549b43df84582083a1f2')

prepare() {
    cd "${pkgname}-${pkgver}"
    patch -Np1 -i "${srcdir}/ffmpeg7-codec-capabilities.patch"
}

build() {
    export CXXFLAGS+=" -I/usr/include/opencv4"
    local cmake_options=(
        -B build
        -D CMAKE_BUILD_TYPE=Release
        -D CMAKE_INSTALL_PREFIX=/usr
        -D USE_QT6=ON
        -S "${pkgname}-${pkgver}"
        -W no-author
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
