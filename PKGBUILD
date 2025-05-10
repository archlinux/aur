# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=x86

pkgname=android-${_android_arch}-libtheora
pkgver=1.2.0
pkgrel=1
pkgdesc="An open video codec developed by the Xiph.org (Android ${_android_arch})"
arch=('any')
url="http://xiph.org"
license=("BSD")
groups=('android-libtheora')
depends=("android-${_android_arch}-libvorbis")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs)
source=("http://downloads.xiph.org/releases/theora/libtheora-${pkgver}.tar.xz")
md5sums=('ec64ed07bffb5f45dca0ae7faa68f814')

prepare() {
    cd "${srcdir}/libtheora-${pkgver}"
    source android-env ${_android_arch}

    autoreconf -fiv -I m4
}

build() {
    cd "${srcdir}/libtheora-${pkgver}"
    source android-env ${_android_arch}

    extra_options=

    # Platform specific patches
    case "${_android_arch}" in
        armv7a-eabi)
             extra_options="${extra_options} --disable-asm"
            ;;
        *)
            ;;
    esac

    android-${_android_arch}-configure \
        --disable-examples \
        ${extra_options}
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libtheora-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
