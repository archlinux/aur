# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Daniel Bermond <dbermond@archlinux.org>

_android_arch=x86-64

pkgname=android-${_android_arch}-libvpl
pkgver=2.12.0
pkgrel=1
arch=('any')
pkgdesc="Intel Video Processing Library (Android ${_android_arch})"
url='https://intel.github.io/libvpl/'
license=('MIT')
depends=("android-${_android_arch}-libdrm"
         "android-${_android_arch}-libva"
         "android-${_android_arch}-libx11")
makedepends=('android-cmake'
             "android-${_android_arch}-libpciaccess")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/intel/libvpl/archive/v${pkgver}/libvpl-${pkgver}.tar.gz")
md5sums=('fec0cc0ac195ea70509160eb424da87a')

build() {
    cd "${srcdir}/libvpl-${pkgver}"
    source android-env ${_android_arch}

    export CFLAGS="${CFLAGS} -DNDEBUG"
    export CXXFLAGS="${CXXFLAGS} -DNDEBUG"

    android-${_android_arch}-cmake \
        -S . \
        -B build \
        -DCMAKE_INSTALL_SYSCONFDIR="${ANDROID_PREFIX_ETC}" \
        -DBUILD_TOOLS=OFF \
        -DBUILD_EXAMPLES=OFF \
        -DBUILD_TESTS=OFF \
        -DINSTALL_EXAMPLE_CODE=OFF \
        -DTOOLS_ENABLE_OPENCL=OFF \
        -Wno-dev
    make -C build $MAKEFLAGS
}

package() {
    cd "${srcdir}/libvpl-${pkgver}"
    source android-env ${_android_arch}

    make -C build DESTDIR="$pkgdir" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
}
