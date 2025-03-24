# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Adam Fontenot <fontenot@ucla.edu>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libheif
pkgver=1.19.7
pkgrel=2
arch=('any')
pkgdesc="An HEIF and AVIF file format decoder and encoder (Android ${_android_arch})"
url='https://github.com/strukturag/libheif'
license=('GPL3')
groups=('android-libheif')
makedepends=('android-cmake'
             "android-${_android_arch}-dav1d"
             "android-${_android_arch}-ffmpeg"
             "android-${_android_arch}-gdk-pixbuf2"
             "android-${_android_arch}-libjpeg"
             "android-${_android_arch}-libpng"
             "android-${_android_arch}-svt-av1"
             'doxygen')

# riscv64 target is not properly supported by rust so disable the rav1e
# dependency in that architecture for now
if [ "${_android_arch}" != riscv64 ]; then
    makedepends+=("android-${_android_arch}-rav1e")
fi

depends=("android-${_android_arch}-aom"
         "android-${_android_arch}-libde265"
         "android-${_android_arch}-libwebp"
         "android-${_android_arch}-x265")
optdepends=("android-${_android_arch}-libjpeg: for heif-convert and heif-enc"
            "android-${_android_arch}-libpng: for heif-convert and heif-enc"
            "android-${_android_arch}-dav1d: dav1d encoder"
            "android-${_android_arch}-ffmpeg: hardware decode"
            "android-${_android_arch}-svt-av1: svt-av1 encoder")

if [ "${_android_arch}" != riscv64 ]; then
    optdepends+=("android-${_android_arch}-rav1e: rav1e encoder")
fi

conflicts=("android-${_android_arch}-libheif-boostrap")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/strukturag/libheif/releases/download/v${pkgver}/libheif-${pkgver}.tar.gz")
md5sums=('cbb49df3d35360d228bac47f4287f2b8')

build() {
    cd "${srcdir}/libheif-${pkgver}"
    source android-env ${_android_arch}

    openjpeg_dir=$(ls "${ANDROID_PREFIX_LIB}/cmake" | grep openjpeg- | head -n 1)

    if [ "${_android_arch}" != riscv64 ]; then
        extra_options="-DWITH_RAV1E=ON
                       -DRAV1E_INCLUDE_DIR='${ANDROID_PREFIX_INCLUDE}/rav1e'"
        extra_options_shared="-DRAV1E_LIBRARY='${ANDROID_PREFIX_LIB}/librav1e.so'"
        extra_options_static="-DRAV1E_LIBRARY='${ANDROID_PREFIX_LIB}/librav1e.a'"
    else
        extra_options="-DWITH_RAV1E=OFF"
    fi

    android-${_android_arch}-cmake \
        -S . \
        -B build-shared \
        -DBUILD_SHARED_LIBS=ON \
        -DBUILD_TESTING=OFF \
        -DWITH_EXAMPLES=OFF \
        -DWITH_DAV1D=ON \
        -DWITH_FFMPEG_DECODER=ON \
        -DWITH_FFMPEG_DECODER_PLUGIN=ON \
        -DWITH_SvtEnc=ON \
        -DWITH_JPEG_DECODER=ON \
        -DWITH_JPEG_ENCODER=ON \
        -DWITH_OpenJPEG_DECODER=ON \
        -DWITH_OpenJPEG_ENCODER=ON \
        -DLIBDE265_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DLIBDE265_LIBRARY="${ANDROID_PREFIX_LIB}/libde265.so" \
        -DX265_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DX265_LIBRARY="${ANDROID_PREFIX_LIB}/libx265.so" \
        -DDAV1D_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DDAV1D_LIBRARY="${ANDROID_PREFIX_LIB}/libdav1d.so" \
        -DAOM_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DAOM_LIBRARY="${ANDROID_PREFIX_LIB}/libaom.so" \
        -DSvtEnc_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DSvtEnc_LIBRARY="${ANDROID_PREFIX_LIB}/libSvtAv1Enc.so" \
        -DLIBSHARPYUV_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}/webp" \
        -DLIBSHARPYUV_LIBRARY="${ANDROID_PREFIX_LIB}/libsharpyuv.so" \
        -DJPEG_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DJPEG_LIBRARY_RELEASE="${ANDROID_PREFIX_LIB}/libjpeg.so" \
        -DOpenJPEG_DIR="${ANDROID_PREFIX_LIB}/cmake/$openjpeg_dir" \
        -DFFMPEG_INCLUDE_DIRS="${ANDROID_PREFIX_INCLUDE}" \
        -DFFMPEG_avcodec_LIBRARY="${ANDROID_PREFIX_LIB}/libavcodec.so" \
        -DFFMPEG_avdevice_LIBRARY="${ANDROID_PREFIX_LIB}/libavdevice.so" \
        -DFFMPEG_avfilter_LIBRARY="${ANDROID_PREFIX_LIB}/libavfilter.so" \
        -DFFMPEG_avformat_LIBRARY="${ANDROID_PREFIX_LIB}/libavformat.so" \
        -DFFMPEG_avresample_LIBRARY="${ANDROID_PREFIX_LIB}/libavresample.so" \
        -DFFMPEG_avutil_LIBRARY="${ANDROID_PREFIX_LIB}/libavutil.so" \
        -DFFMPEG_swresample_LIBRARY="${ANDROID_PREFIX_LIB}/libswresample.so" \
        -DFFMPEG_swscale_LIBRARY="${ANDROID_PREFIX_LIB}/libswscale.so" \
        ${extra_options} \
        ${extra_options_shared}
    sed -i "s|  -lgdk_pixbuf-2.0 |  -L${ANDROID_PREFIX_LIB} -lgdk_pixbuf-2.0 |g" build-shared/gdk-pixbuf/CMakeFiles/pixbufloader-heif.dir/link.txt
    make -C build-shared $MAKEFLAGS

    android-${_android_arch}-cmake \
        -S . \
        -B build-static \
        -DBUILD_SHARED_LIBS=OFF \
        -DBUILD_TESTING=OFF \
        -DWITH_EXAMPLES=OFF \
        -DWITH_DAV1D=ON \
        -DWITH_FFMPEG_DECODER=ON \
        -DWITH_FFMPEG_DECODER_PLUGIN=ON \
        -DWITH_SvtEnc=ON \
        -DWITH_JPEG_DECODER=ON \
        -DWITH_JPEG_ENCODER=ON \
        -DWITH_OpenJPEG_DECODER=ON \
        -DWITH_OpenJPEG_ENCODER=ON \
        -DWITH_X265=OFF \
        -DLIBDE265_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DLIBDE265_LIBRARY="${ANDROID_PREFIX_LIB}/libde265.a" \
        -DDAV1D_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DDAV1D_LIBRARY="${ANDROID_PREFIX_LIB}/libdav1d.a" \
        -DAOM_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DAOM_LIBRARY="${ANDROID_PREFIX_LIB}/libaom.a" \
        -DSvtEnc_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DSvtEnc_LIBRARY="${ANDROID_PREFIX_LIB}/libSvtAv1Enc.a" \
        -DLIBSHARPYUV_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}/webp" \
        -DLIBSHARPYUV_LIBRARY="${ANDROID_PREFIX_LIB}/libsharpyuv.a" \
        -DJPEG_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DJPEG_LIBRARY_RELEASE="${ANDROID_PREFIX_LIB}/libjpeg.a" \
        -DOpenJPEG_DIR="${ANDROID_PREFIX_LIB}/cmake/$openjpeg_dir" \
        -DFFMPEG_INCLUDE_DIRS="${ANDROID_PREFIX_INCLUDE}" \
        -DFFMPEG_avcodec_LIBRARY="${ANDROID_PREFIX_LIB}/libavcodec.a" \
        -DFFMPEG_avdevice_LIBRARY="${ANDROID_PREFIX_LIB}/libavdevice.a" \
        -DFFMPEG_avfilter_LIBRARY="${ANDROID_PREFIX_LIB}/libavfilter.a" \
        -DFFMPEG_avformat_LIBRARY="${ANDROID_PREFIX_LIB}/libavformat.a" \
        -DFFMPEG_avresample_LIBRARY="${ANDROID_PREFIX_LIB}/libavresample.a" \
        -DFFMPEG_avutil_LIBRARY="${ANDROID_PREFIX_LIB}/libavutil.a" \
        -DFFMPEG_swresample_LIBRARY="${ANDROID_PREFIX_LIB}/libswresample.a" \
        -DFFMPEG_swscale_LIBRARY="${ANDROID_PREFIX_LIB}/libswscale.a" \
        ${extra_options} \
        ${extra_options_static}
    sed -i "s|  -lgdk_pixbuf-2.0 |  -L${ANDROID_PREFIX_LIB} -lgdk_pixbuf-2.0 |g" build-static/gdk-pixbuf/CMakeFiles/pixbufloader-heif.dir/link.txt
    make -C build-static $MAKEFLAGS
}

package() {
    cd "${srcdir}/libheif-${pkgver}"
    source android-env ${_android_arch}

    make -C build-shared DESTDIR="${pkgdir}" install
    make -C build-static DESTDIR="${pkgdir}" install
    find "${pkgdir}/${ANDROID_PREFIX_LIB}" -type f -name '*.so' -exec ${ANDROID_STRIP} -g --strip-unneeded {} \;
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
