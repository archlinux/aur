# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=x86

pkgname=android-${_android_arch}-ffmpeg
pkgver=7.1.1
pkgrel=1
arch=('any')
pkgdesc="Complete solution to record, convert and stream audio and video (Android ${_android_arch})"
url="http://ffmpeg.org/"
license=('GPL3')
groups=('android-ffmpeg')
depends=("android-${_android_arch}-alsa-lib"
         "android-${_android_arch}-aom"
         "android-${_android_arch}-bzip2"
         "android-${_android_arch}-cairo"
         "android-${_android_arch}-dav1d"
         "android-${_android_arch}-fontconfig"
         "android-${_android_arch}-freetype2"
         "android-${_android_arch}-fribidi"
         "android-${_android_arch}-glib2"
         "android-${_android_arch}-gmp"
         "android-${_android_arch}-gnutls"
         "android-${_android_arch}-gsm"
         "android-${_android_arch}-harfbuzz"
         "android-${_android_arch}-lame"
         "android-${_android_arch}-libass"
         "android-${_android_arch}-libavc1394"
         "android-${_android_arch}-libbluray"
         "android-${_android_arch}-libbs2b"
         "android-${_android_arch}-libdrm"
         "android-${_android_arch}-libidn2"
         "android-${_android_arch}-libiec61883"
         "android-${_android_arch}-libjxl"
         "android-${_android_arch}-libmodplug"
         "android-${_android_arch}-libopenmpt"
         "android-${_android_arch}-libraw1394"
         "android-${_android_arch}-libsoxr"
         "android-${_android_arch}-libssh"
         "android-${_android_arch}-libtheora"
         "android-${_android_arch}-libva"
         "android-${_android_arch}-libvdpau"
         "android-${_android_arch}-libvorbis"
         "android-${_android_arch}-libvpl"
         "android-${_android_arch}-libvpx"
         "android-${_android_arch}-libwebp"
         "android-${_android_arch}-libx11"
         "android-${_android_arch}-libxcb"
         "android-${_android_arch}-libxext"
         "android-${_android_arch}-libxml2"
         "android-${_android_arch}-libxv"
         "android-${_android_arch}-ocl-icd"
         "android-${_android_arch}-opencore-amr"
         "android-${_android_arch}-openjpeg2"
         "android-${_android_arch}-opus"
         "android-${_android_arch}-rubberband"
         "android-${_android_arch}-sdl2"
         "android-${_android_arch}-snappy"
         "android-${_android_arch}-speex"
         "android-${_android_arch}-srt"
         "android-${_android_arch}-svt-av1"
         "android-${_android_arch}-vid.stab"
         "android-${_android_arch}-vmaf"
         "android-${_android_arch}-x264"
         "android-${_android_arch}-x265"
         "android-${_android_arch}-xvidcore"
         "android-${_android_arch}-xz"
         "android-${_android_arch}-zlib")

if [ "${_android_arch}" != riscv64 ]; then
#    depends+=("android-${_android_arch}-librsvg")
    depends+=("android-${_android_arch}-rav1e")
fi

makedepends=('android-configure'
             "android-${_android_arch}-avisynthplus"
             "android-${_android_arch}-ladspa"
             "android-${_android_arch}-opencl-headers"
             'nasm')
#makedepends+=("android-${_android_arch}-frei0r-plugins")
optdepends=("android-${_android_arch}-avisynthplus: AviSynthPlus support"
            "android-${_android_arch}-ladspa: LADSPA filters")
#optdepends+=("android-${_android_arch}-frei0r-plugins: Frei0r video effects support")
options=(!strip !buildflags staticlibs !emptydirs)
source=("http://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.xz"
        'configure.patch')
md5sums=('26f2bd7d20c6c616f31d7130c88d7250'
         'c1851376794c16bcb37cfa8918e10cba')

prepare() {
    cd "${srcdir}/ffmpeg-${pkgver}"
    source android-env ${_android_arch}

    check_ndk_version_ge_than 18.0
    patch -Np1 -i ../configure.patch
}

build() {
    cd "${srcdir}/ffmpeg-${pkgver}"
    source android-env ${_android_arch}

    unset CC
    unset CXX
    unset AR
    unset RANLIB
    unset STRIP
    unset NM

    case "${_android_arch}" in
        aarch64)
            target_arch=aarch64
            export LDFLAGS="${LDFLAGS} -lm -logg -lvorbis -lcrypto -lssl"
            # export LDFLAGS="${LDFLAGS} -lssh"
            ;;
        armv7a-eabi)
            target_arch=arm
            export LDFLAGS="${LDFLAGS} -ltheoraenc -ltheoradec -logg"
            ;;
        riscv64)
            target_arch=riscv64
            ;;
        x86)
            target_arch=x86_32
            export LDFLAGS="${LDFLAGS} -ltheoraenc -ltheoradec -logg"
            ;;
        x86-64)
            target_arch=x86_64
            export LDFLAGS="${LDFLAGS} -ltheoraenc -ltheoradec -logg"
            ;;
    esac

    extra_options=

    # Platform specific patches
    case "${_android_arch}" in
        riscv64)
             extra_options="${extra_options} --disable-asm"
            ;;
        x86)
             extra_options="${extra_options} --disable-asm"
            ;;
        *)
            ;;
    esac

    if [ "${ANDROID_MINIMUM_PLATFORM}" -lt 26 ]; then
        extra_options="${extra_options} --disable-libxcb --disable-xlib"

    else
        extra_options="${extra_options} --enable-libxcb"
    fi

    if [ "${_android_arch}" != riscv64 ]; then
#         extra_options="${extra_options} --enable-librsvg"
        extra_options="${extra_options} --enable-librav1e"
    fi

    # Not yet available.
    # extra_options="${extra_options} --enable-frei0r"

    ./configure \
        --prefix=${ANDROID_PREFIX} \
        --enable-shared \
        --enable-static \
        --enable-cross-compile \
        --cross-prefix="${ANDROID_CROSS_PREFIX}" \
        --target-os=android \
        --arch=${target_arch} \
        --sysroot="${ANDROID_SYSROOT}" \
        --pkg-config=${ANDROID_PKGCONFIG} \
        --cc=${ANDROID_CC} \
        --cxx=${ANDROID_CXX} \
        --ar=${ANDROID_AR} \
        --ranlib=${ANDROID_RANLIB} \
        --strip=${ANDROID_STRIP} \
        --nm=${ANDROID_NM} \
        --disable-debug \
        --disable-stripping \
        --enable-gpl \
        --enable-version3 \
        --enable-pic \
        --disable-doc \
        --disable-ffmpeg \
        --disable-ffplay \
        --disable-ffprobe \
        --disable-libv4l2 \
        --disable-v4l2-m2m \
        --disable-indev=v4l2 \
        --disable-outdev=v4l2 \
        --enable-lto \
        --enable-avisynth \
        --enable-fontconfig \
        --enable-gmp \
        --enable-gnutls \
        --enable-ladspa \
        --enable-libaom \
        --enable-libass \
        --enable-libbluray \
        --enable-libbs2b \
        --enable-libdav1d \
        --enable-libdrm \
        --enable-libfreetype \
        --enable-libfribidi \
        --enable-libgsm \
        --enable-libharfbuzz \
        --enable-libiec61883 \
        --enable-libjxl \
        --enable-libmodplug \
        --enable-libmp3lame \
        --enable-libopencore_amrnb \
        --enable-libopencore_amrwb \
        --enable-libopenjpeg \
        --enable-libopenmpt \
        --enable-libopus \
        --enable-librubberband \
        --enable-libsnappy \
        --enable-libsoxr \
        --enable-libspeex \
        --enable-libsrt \
        --enable-libssh \
        --enable-libsvtav1 \
        --enable-libtheora \
        --enable-libvidstab \
        --enable-libvmaf \
        --enable-libvorbis \
        --enable-libvpl \
        --enable-libvpx \
        --enable-libwebp \
        --enable-libx264 \
        --enable-libx265 \
        --enable-libxml2 \
        --enable-libxvid \
        --enable-opencl \
        --enable-jni \
        --enable-mediacodec \
        ${extra_options}
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/ffmpeg-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true
}
