# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Laurent Carlier <lordheavym@gmail.com>

_android_arch=aarch64

pkgname=android-${_android_arch}-opencl-clhpp
pkgver=2024.10.24
pkgrel=1
arch=('any')
pkgdesc="OpenCL C++ header files (Android ${_android_arch})"
url='https://github.com/KhronosGroup/OpenCL-CLHPP'
license=('custom')
groups=('android-opencl-clhpp')
depends=("android-${_android_arch}-opencl-headers")
makedepends=('android-cmake'
             "android-${_android_arch}-opencl-headers")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/KhronosGroup/OpenCL-CLHPP/archive/v${pkgver}.tar.gz")
md5sums=('03f3ff1a113f217c25a78c0df1b4da1b')

prepare() {
    cd "${srcdir}/OpenCL-CLHPP-${pkgver}"

    sed -i 's|cmake_minimum_required(VERSION 3.1)|cmake_minimum_required(VERSION 3.6)|g' CMakeLists.txt
}

build() {
    cd "${srcdir}/OpenCL-CLHPP-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build \
        -DBUILD_EXAMPLES=OFF \
        -DBUILD_DOCS=ON \
        -DBUILD_TESTING=OFF \
        -DOpenCLHeaders_DIR="${ANDROID_PREFIX_SHARE}/cmake/OpenCLHeaders" \
        -Wno-dev
    make -C build $MAKEFLAGS
}

package() {
    cd "${srcdir}/OpenCL-CLHPP-${pkgver}"
    source android-env ${_android_arch}

    make -C build DESTDIR="${pkgdir}" install
}
