# PKGBUILD for android-ffmpeg
# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=x86
source android-env.sh ${_android_arch}

pkgname=android-${_android_arch}-ffmpeg
pkgver=4.1.3
pkgrel=1
pkgdesc="Complete solution to record, convert and stream audio and video (android)"
arch=('any')
url="http://ffmpeg.org/"
license=('GPL3')
depends=("android-${_android_arch}-libvorbis"
         "android-${_android_arch}-libvpx"
         "android-${_android_arch}-opus")
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-pkg-config' 'yasm')
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
            export LDFLAGS="-L${ANDROID_LIBS}/lib -lm -logg -lvorbis"
            ;;
        armv7a-eabi)
            target_arch=arm
            ;;
        x86)
            target_arch=x86_32
            ;;
        x86-64)
            target_arch=x86_64
            ;;
    esac

    configue_opts="
        --prefix="${ANDROID_LIBS}"
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
        --disable-stripping
        --enable-gpl
        --enable-shared
        --enable-version3
        --enable-pic
        --disable-doc
        --disable-ffmpeg
        --disable-ffprobe
        --disable-libv4l2
        --disable-v4l2-m2m
        --disable-indev=v4l2
        --disable-outdev=v4l2
        --enable-libvorbis
        --enable-libvpx
        --enable-libopus"

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

    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_LIBS}/lib/*.so
    ${ANDROID_STRIP} -g "${pkgdir}"/${ANDROID_LIBS}/lib/*.a
}
