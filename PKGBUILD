# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Adam Fontenot <fontenot@ucla.edu>

_android_arch=aarch64

pkgname=android-${_android_arch}-libheif
pkgver=1.17.6
pkgrel=1
arch=('any')
pkgdesc="An HEIF and AVIF file format decoder and encoder (Android ${_android_arch})"
url='https://github.com/strukturag/libheif'
license=('GPL3')
makedepends=('android-cmake'
             "android-${_android_arch}-dav1d"
             "android-${_android_arch}-ffmpeg"
             "android-${_android_arch}-gdk-pixbuf2"
             "android-${_android_arch}-libjpeg"
             "android-${_android_arch}-libpng"
             "android-${_android_arch}-rav1e"
             "android-${_android_arch}-svt-av1"
             'doxygen')
depends=("android-${_android_arch}-aom"
         "android-${_android_arch}-libde265"
         "android-${_android_arch}-libwebp"
         "android-${_android_arch}-x265")
optdepends=("android-${_android_arch}-libjpeg: for heif-convert and heif-enc"
            "android-${_android_arch}-libpng: for heif-convert and heif-enc"
            "android-${_android_arch}-dav1d: dav1d encoder"
            "android-${_android_arch}-ffmpeg: hardware decode"
            "android-${_android_arch}-rav1e: rav1e encoder"
            "android-${_android_arch}-svt-av1: svt-av1 encoder")
conflicts=("android-${_android_arch}-libheif-boostrap")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/strukturag/libheif/releases/download/v$pkgver/libheif-$pkgver.tar.gz"
        "https://github.com/strukturag/libheif/commit/a911b26a902c5f89fee2dc20ac4dfaafcb8144ec.patch")
sha256sums=('8390baf4913eda0a183e132cec62b875fb2ef507ced5ddddc98dfd2f17780aee'
            '53a7eeb0f0f1c9fb076a6f56c6753abf8e30cf625355c54e720cc028ae9c1ce9')

prepare() {
    cd "${srcdir}/libheif-$pkgver"

    patch -Np1 -i ../a911b26a902c5f89fee2dc20ac4dfaafcb8144ec.patch # fix build against svt-av1 2.0.0
}

build() {
    cd "${srcdir}/libheif-$pkgver"
    source android-env ${_android_arch}

    openjpeg_dir=$(ls "${ANDROID_PREFIX_LIB}/cmake" | grep openjpeg- | head -n 1)

    android-${_android_arch}-cmake \
        -S . \
        -B build \
        -DBUILD_TESTING=OFF \
        -DWITH_EXAMPLES=OFF \
        -DWITH_DAV1D=ON \
        -DWITH_RAV1E=ON \
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
        -DRAV1E_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}/rav1e" \
        -DRAV1E_LIBRARY="${ANDROID_PREFIX_LIB}/librav1e.so" \
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
        -DFFMPEG_swscale_LIBRARY="${ANDROID_PREFIX_LIB}/libswscale.so"
    sed -i "s|  -lgdk_pixbuf-2.0 |  -L${ANDROID_PREFIX_LIB} -lgdk_pixbuf-2.0 |g" build/gdk-pixbuf/CMakeFiles/pixbufloader-heif.dir/link.txt
    make -C build $MAKEFLAGS
}

package() {
    cd "${srcdir}/libheif-$pkgver"
    source android-env ${_android_arch}

    make -C build DESTDIR="$pkgdir" install
    find "${pkgdir}/${ANDROID_PREFIX_LIB}" -type f -name '*.so' -exec ${ANDROID_STRIP} -g --strip-unneeded {} \;
}
