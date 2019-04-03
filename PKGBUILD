# PKGBUILD for android-ffmpeg
# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=x86
source android-env.sh ${_android_arch}

pkgname=android-${_android_arch}-ffmpeg
pkgver=4.1.2
pkgrel=1
pkgdesc="Complete solution to record, convert and stream audio and video (android)"
arch=('any')
url="http://ffmpeg.org/"
license=('GPL3')
depends=('apache-ant'
         'android-ndk>=r18.b'
         "android-platform-$ANDROID_MINIMUM_PLATFORM"
         'android-sdk-25.2.5'
         'android-sdk-build-tools'
         'android-sdk-platform-tools')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-pkg-config' 'git' 'yasm')
source=("git+https://git.ffmpeg.org/ffmpeg.git#tag=n${pkgver}"
        configure.patch)
sha256sums=('SKIP'
            '574f234bd6e09c47e8435faffd464a3fe01dcfdfd939889e6608451f795a1701')

_pref=/opt/android-libs/$_android_arch

prepare() {
    cd ffmpeg
    patch -Np1 -i ../configure.patch
}

build() {
    cd ffmpeg

    unset CC
    unset CXX
    unset CFLAGS
    unset CXXFLAGS
    unset LDFLAGS
    unset CHOST
    unset CARCH

    case "$_android_arch" in
        aarch64)
            target_arch=aarch64
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
        --prefix="${_pref}"
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
        --disable-outdev=v4l2"

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
    cd ffmpeg
    make DESTDIR="$pkgdir" install

    ${ANDROID_STRIP} "${pkgdir}"/${_pref}/lib/*.a
    ${ANDROID_STRIP} "${pkgdir}"/${_pref}/lib/*.so
}
