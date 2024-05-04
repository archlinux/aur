# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-ocl-icd
pkgver=2.3.2
pkgrel=1
arch=('any')
pkgdesc="OpenCL ICD Bindings (Android ${_android_arch})"
url="https://github.com/OCL-dev/ocl-icd"
license=('BSD')
depends=('android-ndk')
makedepends=('android-configure'
             "android-${_android_arch}-opencl-headers>=2.1"
             'ruby'
             'xmlto')
provides=("android-${_android_arch}-opencl-icd-loader")
conflicts=("android-${_android_arch}-libcl")
replaces=("android-${_android_arch}-libcl")
optdepends=("android-${_android_arch}-opencl-driver: packaged opencl driver")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/OCL-dev/ocl-icd/archive/v${pkgver}.tar.gz")
sha256sums=('ec47d7dcd961ea06695b067e8b7edb82e420ddce03e0081a908c62fd0b8535c5')

prepare() {
    cd "${srcdir}/ocl-icd-$pkgver"
    source android-env ${_android_arch}

    autoreconf -fiv
}

build() {
    cd "${srcdir}/ocl-icd-$pkgver"
    source android-env ${_android_arch}

    # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
    export CFLAGS="${CFLAGS} -fcommon"
    export ac_cv_func_malloc_0_nonnull=yes
    export ac_cv_func_realloc_0_nonnull=yes

    android-${_android_arch}-configure
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/ocl-icd-$pkgver"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir/" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
