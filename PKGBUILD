# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=x86-64

pkgname=android-${_android_arch}-ffmpeg-minimal
pkgver=7.1.1
pkgrel=2
arch=('any')
pkgdesc="Complete solution to record, convert and stream audio and video (Android ${_android_arch})"
url="http://ffmpeg.org/"
license=('GPL3')
groups=('android-ffmpeg-minimal')
depends=("android-${_android_arch}-aom"
         "android-${_android_arch}-bzip2"
         "android-${_android_arch}-dav1d"
         "android-${_android_arch}-glib2"
         "android-${_android_arch}-gnutls"
         "android-${_android_arch}-lame"
         "android-${_android_arch}-libssh"
         "android-${_android_arch}-libvorbis"
         "android-${_android_arch}-libvpx"
         "android-${_android_arch}-opus"
         "android-${_android_arch}-svt-av1")
makedepends=('android-configure'
             'nasm')
provides=(${pkgname%-minimal})
conflicts=(${pkgname%-minimal})
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
            ;;
        armv7a-eabi)
            target_arch=arm
            ;;
        riscv64)
            target_arch=riscv64
            ;;
        x86)
            target_arch=x86_32
            ;;
        x86-64)
            target_arch=x86_64
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

    ./configure \
        --prefix=${ANDROID_PREFIX} \
        --enable-shared \
        --enable-static \
        --enable-small \
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
        --disable-alsa \
        --disable-avfilter \
        --disable-encoders \
        --enable-encoder=aac \
        --enable-encoder=libmp3lame \
        --enable-encoder=libopus \
        --enable-encoder=libvorbis \
        --enable-encoder=libvpx_vp8 \
        --enable-encoder=libvpx_vp9 \
        --enable-encoder=opus \
        --enable-encoder=vorbis \
        --enable-encoder=av1_mediacodec \
        --enable-encoder=h264_mediacodec \
        --enable-encoder=hevc_mediacodec \
        --enable-encoder=mpeg4_mediacodec \
        --enable-encoder=vp8_mediacodec \
        --enable-encoder=vp9_mediacodec \
        --disable-muxers \
        --enable-muxer=mp4 \
        --enable-muxer=webm \
        --disable-demuxers \
        --enable-demuxer=matroska \
        --enable-demuxer=mov \
        --enable-demuxer=webm_dash_manifest \
        --disable-decoders \
        --enable-decoder=aac \
        --enable-decoder=aac_fixed \
        --enable-decoder=aac_latm \
        --enable-decoder=av1 \
        --enable-decoder=h264 \
        --enable-decoder=hevc \
        --enable-decoder=libaom_av1 \
        --enable-decoder=libdav1d \
        --enable-decoder=libopus \
        --enable-decoder=libvorbis \
        --enable-decoder=libvpx_vp8 \
        --enable-decoder=libvpx_vp9 \
        --enable-decoder=opus \
        --enable-decoder=vorbis \
        --enable-decoder=vp8 \
        --enable-decoder=vp9 \
        --enable-decoder=aac_mediacodec \
        --enable-decoder=amrnb_mediacodec \
        --enable-decoder=amrwb_mediacodec \
        --enable-decoder=av1_mediacodec \
        --enable-decoder=h264_mediacodec \
        --enable-decoder=hevc_mediacodec \
        --enable-decoder=mp3_mediacodec \
        --enable-decoder=mpeg2_mediacodec \
        --enable-decoder=mpeg4_mediacodec \
        --enable-decoder=vp8_mediacodec \
        --enable-decoder=vp9_mediacodec \
        --disable-parsers \
        --enable-parser=aac \
        --enable-parser=aac_latm \
        --enable-parser=av1 \
        --enable-parser=h264 \
        --enable-parser=hevc \
        --enable-parser=opus \
        --enable-parser=vorbis \
        --enable-parser=vp8 \
        --enable-parser=vp9 \
        --disable-postproc \
        --disable-hwaccels \
        --disable-devices \
        --disable-iconv \
        --disable-sdl2 \
        --disable-xlib \
        --disable-large-tests \
        --disable-cuda-llvm \
        --disable-libdrm \
        --disable-vaapi \
        --disable-vdpau \
        --disable-libxcb \
        --disable-libxcb-shm \
        --disable-libxcb-xfixes \
        --disable-libxcb-shape \
        --disable-bzlib \
        --disable-lzma \
        --disable-zlib \
        --enable-lto \
        --enable-libaom \
        --enable-libdav1d \
        --enable-libmp3lame \
        --enable-libopus \
        --enable-libsvtav1 \
        --enable-libvorbis \
        --enable-libvpx \
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
