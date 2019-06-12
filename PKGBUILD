# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=aarch64
source android-env ${_android_arch}

pkgname=android-${_android_arch}-ffmpeg
pkgver=4.1.3
pkgrel=4
pkgdesc="Complete solution to record, convert and stream audio and video (android)"
arch=('any')
url="http://ffmpeg.org/"
license=('GPL3')
depends=("android-${_android_arch}-bzip2"
         "android-${_android_arch}-lame"
         "android-${_android_arch}-libtheora"
         "android-${_android_arch}-libvorbis"
         "android-${_android_arch}-libvpx"
         "android-${_android_arch}-opus"
         "android-${_android_arch}-speex"
         "android-${_android_arch}-zlib")
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-environment' 'android-pkg-config' 'yasm')
source=("http://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.xz"
        'configure.patch')
sha256sums=('0c3020452880581a8face91595b239198078645e7d7184273b8bcc7758beb63d'
            '574f234bd6e09c47e8435faffd464a3fe01dcfdfd939889e6608451f795a1701')

prepare() {
    cd "${srcdir}"/ffmpeg-${pkgver}
    check_ndk_version_ge_than 18.0
    patch -Np1 -i ../configure.patch
}

build() {
    cd "${srcdir}"/ffmpeg-${pkgver}

    unset CC
    unset CXX
    unset CFLAGS
    unset CXXFLAGS
    unset CHOST
    unset CARCH

    case "$_android_arch" in
        aarch64)
            target_arch=aarch64
            export LDFLAGS="-L${ANDROID_PREFIX_LIB} -lm -logg -lvorbis"
            ;;
        armv7a-eabi)
            target_arch=arm
            export LDFLAGS="-L${ANDROID_PREFIX_LIB} -ltheoraenc -ltheoradec -logg"
            ;;
        x86)
            target_arch=x86_32
            export LDFLAGS="-L${ANDROID_PREFIX_LIB} -ltheoraenc -ltheoradec -logg"
            ;;
        x86-64)
            target_arch=x86_64
            export LDFLAGS="-L${ANDROID_PREFIX_LIB} -ltheoraenc -ltheoradec -logg"
            ;;
    esac

    configue_opts="
        --prefix="${ANDROID_PREFIX}"
        --enable-cross-compile
        --cross-prefix="${ANDROID_CROSS_PREFIX}"
        --target-os=android
        --arch=${target_arch}
        --sysroot="${ANDROID_SYSROOT}"
        --pkg-config=${ANDROID_PKGCONFIG}
        --cc=${ANDROID_CC}
        --cxx=${ANDROID_CXX}
        --ar=${ANDROID_AR}
        --ranlib=${ANDROID_RANLIB}
        --strip=${ANDROID_STRIP}
        --nm=${ANDROID_NM}
        --disable-debug
        --enable-static
        --enable-shared
        --disable-stripping
        --enable-gpl
        --enable-version3
        --enable-pic
        --disable-doc
        --disable-ffmpeg
        --disable-ffprobe
        --disable-libv4l2
        --disable-v4l2-m2m
        --disable-indev=v4l2
        --disable-outdev=v4l2
        --enable-libmp3lame
        --enable-libspeex
        --enable-libtheora
        --enable-libvorbis
        --enable-libvpx
        --enable-libopus
        --enable-zlib"

    # Platform specific patches
    case "$_android_arch" in
        x86)
             configue_opts+="
                 --disable-asm"
            ;;
        *)
            ;;
    esac

    ./configure ${configue_opts}
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}"/ffmpeg-${pkgver}
    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}"/${ANDROID_PREFIX_SHARE}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.a
}
