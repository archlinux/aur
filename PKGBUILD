# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=aarch64

pkgname=android-${_android_arch}-libvpx
pkgver=1.15.0
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
md5sums=('6d2b7b8e1c06f4b10ae63ca22491f8a4')

prepare() {
    source android-env ${_android_arch}
    check_ndk_version_ge_than 18.0
}

build() {
    cd "${srcdir}/libvpx-${pkgver}"
    source android-env ${_android_arch}

    # Platform specific patches
    case "${_android_arch}" in
        aarch64)
             target=arm64-android-gcc
            ;;
        armv7a-eabi)
             target=armv7-android-gcc
            ;;
        riscv64)
             #target=riscv64-android-gcc
             target=generic-gnu
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

    case "${_android_arch}" in
        armv7a-eabi)
             extra_opts="--disable-neon_asm"
            ;;
        *)
            ;;
    esac

    export CFLAGS="-O2 -pipe -fno-plt -fexceptions"
    export CPPFLAGS="-D_FORTIFY_SOURCE=2 -D__USE_FORTIFY_LEVEL=2"
    export CXXFLAGS="-O2 -pipe -fno-plt -fexceptions"
    export LDFLAGS="-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now,-z,max-page-size=16384"

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
