# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-ocl-icd
pkgver=2.3.3
pkgrel=1
arch=('any')
pkgdesc="OpenCL ICD Bindings (Android ${_android_arch})"
url="https://github.com/OCL-dev/ocl-icd"
license=('BSD')
groups=('android-ocl-icd')
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
md5sums=('8f00257866d84b8b9631c4df6c47ec95')

prepare() {
    cd "${srcdir}/ocl-icd-${pkgver}"
    source android-env ${_android_arch}

    autoreconf -fiv
}

build() {
    cd "${srcdir}/ocl-icd-${pkgver}"
    source android-env ${_android_arch}

    # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
    export CFLAGS="${CFLAGS} -fcommon"
    export ac_cv_func_malloc_0_nonnull=yes
    export ac_cv_func_realloc_0_nonnull=yes

    android-${_android_arch}-configure
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/ocl-icd-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
