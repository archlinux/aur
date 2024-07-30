# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=x86

pkgname=android-${_android_arch}-libvpx
pkgver=1.14.1
pkgrel=1
arch=('any')
pkgdesc="VP8 and VP9 codec (Android ${_android_arch})"
url="http://www.webmproject.org/"
license=('BSD')
groups=('android-libvpx')
depends=('android-ndk')
makedepends=('android-configure'
             'yasm')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/webmproject/libvpx/archive/v${pkgver}.tar.gz")
md5sums=('1d2a1c594587ee1f26a4f017becddcd5')

prepare() {
    source android-env ${_android_arch}
    check_ndk_version_ge_than 18.0
}

build() {
    cd "${srcdir}/libvpx-${pkgver}"
    source android-env ${_android_arch}

    # Platform specific patches
    case "$_android_arch" in
        aarch64)
             target=arm64-android-gcc
            ;;
        armv7a-eabi)
             target=armv7-android-gcc
            ;;
        x86)
             target=x86-android-gcc
            ;;
        x86-64)
             target=x86_64-android-gcc
            ;;
        *)
            ;;
    esac

    case "$_android_arch" in
        armv7a-eabi)
             extra_opts="--disable-neon_asm"
            ;;
        *)
            ;;
    esac

    ./configure \
        --target=${target} \
        --prefix="${ANDROID_PREFIX}" \
        --libdir="${ANDROID_PREFIX_LIB}" \
        --enable-static \
        --disable-examples \
        --disable-tools \
        --disable-docs \
        --disable-unit-tests \
        --disable-install-bins \
        --disable-install-docs \
        --disable-install-srcs \
        --enable-pic \
        --enable-postproc \
        --enable-vp8 \
        --enable-vp9 \
        --enable-vp9-highbitdepth \
        --enable-vp9-temporal-denoising \
        ${extra_opts}
    make DESTDIR="${PWD}/data" $MAKEFLAGS
}

package() {
    cd "${srcdir}/libvpx-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
