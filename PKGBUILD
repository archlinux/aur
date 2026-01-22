# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Sylvain HENRY <hsyl20@yahoo.fr>

_android_arch=riscv64

pkgname=android-${_android_arch}-opencl-headers
pkgver=2025.07.22
pkgrel=1
pkgdesc="OpenCL (Open Computing Language) header files (Android ${_android_arch})"
arch=('any')
url='https://www.khronos.org/registry/cl/'
license=('custom')
groups=('android-opencl-headers')
depeds=('android-ndk')
makedepends=('android-cmake'
             'python')
optdepends=("android-${_android_arch}-opencl-clhpp: C++ support")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/KhronosGroup/OpenCL-Headers/archive/v${pkgver}.tar.gz")
md5sums=('bf236c5823aa60cb26d23f470e5f787e')

build() {
    cd "${srcdir}/OpenCL-Headers-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build \
        -DBUILD_TESTING=OFF \
        -DOPENCL_HEADERS_BUILD_CXX_TESTS=OFF \
        -DOPENCL_HEADERS_BUILD_TESTING=OFF \
        -Wno-dev
    make -C build $MAKEFLAGS
}

package() {
    cd "${srcdir}/OpenCL-Headers-${pkgver}"
    source android-env ${_android_arch}

    make -C build DESTDIR="${pkgdir}" install

    install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
