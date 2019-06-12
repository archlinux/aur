# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=aarch64
source android-env ${_android_arch}

pkgname=android-${_android_arch}-libvpx
pkgver=1.8.0
pkgrel=3
pkgdesc="VP8 and VP9 codec (android)"
arch=('any')
url="http://www.webmproject.org/"
license=('BSD')
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-environment' 'android-pkg-config' 'yasm')
source=(https://github.com/webmproject/libvpx/archive/v${pkgver}.tar.gz)
sha256sums=('86df18c694e1c06cc8f83d2d816e9270747a0ce6abe316e93a4f4095689373f6')

prepare() {
    check_ndk_version_ge_than 18.0
}

build() {
    cd "${srcdir}"/libvpx-${pkgver}

    export CC=${ANDROID_CC}
    export CXX=${ANDROID_CXX}
    export STRIP=${ANDROID_STRIP}

    case "$_android_arch" in
        x86*)
            ;;
        *)
            export AS=${ANDROID_AS}
            ;;
    esac

    target=${_android_arch/aarch64/arm64}
    target=${target/armv7a-eabi/armv7}
    target=${target/x86-/x86_}
    target=${target}-android-gcc

    ./configure \
        --target=${target} \
        --prefix=${ANDROID_PREFIX} \
        --libdir=${ANDROID_PREFIX_LIB} \
        --enable-static \
        --disable-install-bins \
        --disable-docs \
        --disable-install-docs \
        --disable-install-srcs \
        --enable-pic \
        --enable-postproc \
        --enable-vp8 \
        --enable-vp9 \
        --enable-vp9-highbitdepth \
        --enable-vp9-temporal-denoising

    make $MAKEFLAGS
}

package() {
    cd "${srcdir}"/libvpx-${pkgver}

    make DESTDIR="$pkgdir" install
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
