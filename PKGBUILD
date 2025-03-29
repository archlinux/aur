# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Bruno Pagani <archange@archlinux.org>

_android_arch=aarch64

pkgname=android-${_android_arch}-libavif
pkgver=1.2.1
pkgrel=1
arch=('any')
pkgdesc="Library for encoding and decoding .avif files (Android ${_android_arch})"
url="https://github.com/AOMediaCodec/libavif"
license=('LicenseRef-libavif')
groups=('android-libavif')
depends=("android-${_android_arch}-aom"
         "android-${_android_arch}-dav1d"
         "android-${_android_arch}-svt-av1"
         "android-${_android_arch}-libpng"
         "android-${_android_arch}-libjpeg"
         "android-${_android_arch}-libyuv")
makedepends=('android-cmake'
             "android-${_android_arch}-gdk-pixbuf2"
             'nasm')
options=(!strip !buildflags staticlibs !emptydirs)
source=("${url}/archive/v${pkgver}/libavif-${pkgver}.tar.gz")
md5sums=('042743746b899c94b84749b852ccc018')

build() {
    cd "${srcdir}/libavif-${pkgver}"
    source android-env ${_android_arch}

    extra_options=""
    extra_options_shared=""
    extra_options_static=""

    case "${_android_arch}" in
        riscv64)
            extra_options="-DAVIF_CODEC_RAV1E=OFF"
            ;;
        *)
            extra_options="-DAVIF_CODEC_RAV1E=SYSTEM
                           -DRAV1E_INCLUDE_DIR='${ANDROID_PREFIX_INCLUDE}/rav1e'"
            extra_options_shared="-DRAV1E_LIBRARY='${ANDROID_PREFIX_LIB}/librav1e.so'"
            extra_options_static="-DRAV1E_LIBRARY='${ANDROID_PREFIX_LIB}/librav1e.a'"
            ;;
    esac

    android-${_android_arch}-cmake \
        -S . \
        -B build-shared \
        -DBUILD_SHARED_LIBS=ON \
        -DAVIF_BUILD_APPS=OFF \
        -DAVIF_CODEC_AOM=SYSTEM \
        -DAVIF_CODEC_DAV1D=SYSTEM \
        -DAVIF_CODEC_SVT=SYSTEM \
        -DAVIF_BUILD_GDK_PIXBUF=ON \
        -DAVIF_ENABLE_GTEST=OFF \
        -DDAV1D_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DDAV1D_LIBRARY="${ANDROID_PREFIX_LIB}/libdav1d.so" \
        -DSVT_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DSVT_LIBRARY="${ANDROID_PREFIX_LIB}/libSvtAv1Enc.so" \
        -DAOM_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DAOM_LIBRARY="${ANDROID_PREFIX_LIB}/libaom.so" \
        -DPNG_PNG_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DPNG_LIBRARY="${ANDROID_PREFIX_LIB}/libpng.so" \
        -DJPEG_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DJPEG_LIBRARY="${ANDROID_PREFIX_LIB}/libjpeg.so" \
        -DLIBYUV_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}/libyuv" \
        -DLIBYUV_LIBRARY="${ANDROID_PREFIX_LIB}/libyuv.so" \
        ${extra_options} \
        ${extra_options_shared}
    sed -i "s|  -lgdk_pixbuf-2.0|  -L${ANDROID_PREFIX_LIB} -lgdk_pixbuf-2.0|g" build-shared/contrib/gdk-pixbuf/CMakeFiles/pixbufloader-avif.dir/link.txt
    make -C build-shared $MAKEFLAGS

    android-${_android_arch}-cmake \
        -S . \
        -B build-static \
        -DBUILD_SHARED_LIBS=OFF \
        -DAVIF_BUILD_APPS=OFF \
        -DAVIF_CODEC_AOM=SYSTEM \
        -DAVIF_CODEC_DAV1D=SYSTEM \
        -DAVIF_CODEC_SVT=SYSTEM \
        -DAVIF_BUILD_GDK_PIXBUF=ON \
        -DAVIF_ENABLE_GTEST=OFF \
        -DDAV1D_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DDAV1D_LIBRARY="${ANDROID_PREFIX_LIB}/libdav1d.a" \
        -DSVT_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DSVT_LIBRARY="${ANDROID_PREFIX_LIB}/libSvtAv1Enc.a" \
        -DAOM_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DAOM_LIBRARY="${ANDROID_PREFIX_LIB}/libaom.a" \
        -DPNG_PNG_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DPNG_LIBRARY="${ANDROID_PREFIX_LIB}/libpng.a" \
        -DJPEG_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DJPEG_LIBRARY="${ANDROID_PREFIX_LIB}/libjpeg.a" \
        -DLIBYUV_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}/libyuv" \
        -DLIBYUV_LIBRARY="${ANDROID_PREFIX_LIB}/libyuv.a" \
        ${extra_options} \
        ${extra_options_static}
    sed -i "s|  -lgdk_pixbuf-2.0|  -L${ANDROID_PREFIX_LIB} -lgdk_pixbuf-2.0|g" build-static/contrib/gdk-pixbuf/CMakeFiles/pixbufloader-avif.dir/link.txt
    make -C build-static $MAKEFLAGS
}

package() {
    cd "${srcdir}/libavif-${pkgver}"
    source android-env ${_android_arch}

    make -C build-shared DESTDIR="${pkgdir}" install
    make -C build-static DESTDIR="${pkgdir}" install
    find "${pkgdir}/${ANDROID_PREFIX_LIB}" -type f -name "*.so" -exec ${ANDROID_STRIP} -g --strip-unneeded {} \;
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
