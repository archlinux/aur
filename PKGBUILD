# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Daniel Bermond <dbermond@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libjxl
pkgver=0.11.1
pkgrel=1
arch=('any')
pkgdesc="JPEG XL image format reference implementation (Android ${_android_arch})"
url='https://jpeg.org/jpegxl/'
license=('BSD-3-Clause')
groups=('android-libjxl')
depends=("android-${_android_arch}-brotli"
         "android-${_android_arch}-giflib"
         "android-${_android_arch}-highway"
         "android-${_android_arch}-lcms2"
         "android-${_android_arch}-libjpeg-turbo"
         "android-${_android_arch}-libpng"
         "android-${_android_arch}-libwebp"
         "android-${_android_arch}-openexr")
makedepends=('git'
             'android-cmake'
             "android-${_android_arch}-gdk-pixbuf2"
             "java-environment"
             "python"
             "asciidoc"
             "xdg-utils")
optdepends=("android-${_android_arch}-gdk-pixbuf2: for gdk-pixbuf loader"
            "java-runtime: for JNI bindings")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/libjxl/libjxl/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('8f26fc954c2d9cb377544a5f029182ef')

prepare() {
    cd "${srcdir}/libjxl-${pkgver}"
    source android-env ${_android_arch}

    ./deps.sh

    sed -i 's|JXL_PARALLEL_RET_SUCCESS|0|g' lib/jxl/base/data_parallel.h
    sed -i 's|JXL_DEC_BOX_COMPLETE|JxlDecoderStatus(0x10000)|g' lib/jxl/decode.cc
    sed -i 's|JXL_ENC_FRAME_SETTING_DISABLE_PERCEPTUAL_HEURISTICS|JxlEncoderFrameSettingId(39)|g' lib/jxl/encode.cc
    sed -i 's|JXL_DEC_BOX_COMPLETE|JxlDecoderStatus(0x10000)|g' lib/jxl/box_content_decoder.cc
}

build() {
    cd "${srcdir}/libjxl-${pkgver}"
    source android-env ${_android_arch}

    export CFLAGS="${CFLAGS} -DNDEBUG -I${ANDROID_PREFIX_INCLUDE}/glib-2.0 -I${ANDROID_PREFIX_INCLUDE}/gdk-pixbuf-2.0 -I${ANDROID_PREFIX_LIB}/glib-2.0/include"
    export CXXFLAGS="${CXXFLAGS} -DNDEBUG -I${ANDROID_PREFIX_INCLUDE}/glib-2.0 -I${ANDROID_PREFIX_INCLUDE}/gdk-pixbuf-2.0 -I${ANDROID_PREFIX_LIB}/glib-2.0/include"

    patchUndefs=(CMakeFiles/CMakeConfigureLog.yaml
                 lib/CMakeFiles/jpeg.dir/link.txt
                 lib/CMakeFiles/jxl_cms.dir/link.txt
                 lib/CMakeFiles/jxl_dec.dir/link.txt
                 lib/CMakeFiles/jxl_threads.dir/link.txt
                 lib/CMakeFiles/jxl.dir/link.txt
                 plugins/gdk-pixbuf/CMakeFiles/pixbufloader-jxl.dir/link.txt
                 tools/CMakeFiles/djxl_fuzzer_runner.dir/link.txt:1
                 tools/CMakeFiles/enc_fast_lossless.dir/link.txt
                 tools/CMakeFiles/jpegli_jni.dir/link.txt
                 tools/CMakeFiles/jxl_jni.dir/link.txt)

    android-${_android_arch}-cmake \
        -S . \
        -B build-shared \
        -DBUILD_SHARED_LIBS=ON \
        -DBUILD_TESTING=OFF \
        -DJPEGXL_ENABLE_BENCHMARK=OFF \
        -DJPEGXL_ENABLE_DOXYGEN=OFF \
        -DJPEGXL_ENABLE_EXAMPLES=OFF \
        -DJPEGXL_ENABLE_FUZZERS=OFF \
        -DJPEGXL_ENABLE_MANPAGES=OFF \
        -DJPEGXL_ENABLE_PLUGINS=ON \
        -DJPEGXL_ENABLE_TOOLS=OFF \
        -DJPEGXL_ENABLE_VIEWERS=OFF \
        -DJPEGXL_ENABLE_SJPEG=OFF \
        -DJPEGXL_ENABLE_PLUGIN_GIMP210=OFF \
        -DJPEGXL_FORCE_SYSTEM_BROTLI=ON \
        -DJPEGXL_FORCE_SYSTEM_GTEST=ON \
        -DJPEGXL_FORCE_SYSTEM_HWY=ON \
        -DJPEGXL_FORCE_SYSTEM_LCMS2=ON \
        -DJPEGXL_BUNDLE_LIBPNG=OFF \
        -DJPEGXL_ENABLE_JNI=ON \
        -DJPEGXL_INSTALL_JARDIR="${ANDROID_PREFIX_SHARE}/java" \
        -DHWY_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DHWY_LIBRARY="${ANDROID_PREFIX_LIB}/libhwy.so" \
        -DBROTLI_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}/brotli" \
        -DBROTLICOMMON_LIBRARY="${ANDROID_PREFIX_LIB}/libbrotlicommon.so" \
        -DBROTLIENC_LIBRARY="${ANDROID_PREFIX_LIB}/libbrotlienc.so" \
        -DBROTLIDEC_LIBRARY="${ANDROID_PREFIX_LIB}/libbrotlidec.so" \
        -DLCMS2_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DLCMS2_LIBRARY="${ANDROID_PREFIX_LIB}/liblcms2.so" \
        -DPNG_PNG_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}/png" \
        -DPNG_LIBRARY="${ANDROID_PREFIX_LIB}/libpng.so" \
        -DZLIB_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DZLIB_LIBRARY_RELEASE="${ANDROID_PREFIX_LIB}/libz.so" \
        -Wno-dev
    sed -i "s|liblcms2.so -lgdk_pixbuf-2.0 |liblcms2.so -L${ANDROID_PREFIX_LIB} -lgdk_pixbuf-2.0 |g" build-shared/plugins/gdk-pixbuf/CMakeFiles/pixbufloader-jxl.dir/link.txt

    for f in "${patchUndefs[@]}"; do
        sed -i "s| -Wl,--no-undefined | |g" "build-shared/${f}" || true
    done

    make -C build-shared $MAKEFLAGS

    android-${_android_arch}-cmake \
        -S . \
        -B build-static \
        -DBUILD_SHARED_LIBS=OFF \
        -DBUILD_TESTING=OFF \
        -DJPEGXL_ENABLE_BENCHMARK=OFF \
        -DJPEGXL_ENABLE_DOXYGEN=OFF \
        -DJPEGXL_ENABLE_EXAMPLES=OFF \
        -DJPEGXL_ENABLE_FUZZERS=OFF \
        -DJPEGXL_ENABLE_MANPAGES=OFF \
        -DJPEGXL_ENABLE_PLUGINS=ON \
        -DJPEGXL_ENABLE_TOOLS=OFF \
        -DJPEGXL_ENABLE_VIEWERS=OFF \
        -DJPEGXL_ENABLE_SJPEG=OFF \
        -DJPEGXL_ENABLE_PLUGIN_GIMP210=OFF \
        -DJPEGXL_FORCE_SYSTEM_BROTLI=ON \
        -DJPEGXL_FORCE_SYSTEM_GTEST=ON \
        -DJPEGXL_FORCE_SYSTEM_HWY=ON \
        -DJPEGXL_FORCE_SYSTEM_LCMS2=ON \
        -DJPEGXL_BUNDLE_LIBPNG=OFF \
        -DJPEGXL_ENABLE_JNI=ON \
        -DJPEGXL_INSTALL_JARDIR="${ANDROID_PREFIX_SHARE}/java" \
        -DHWY_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DHWY_LIBRARY="${ANDROID_PREFIX_LIB}/libhwy.a" \
        -DBROTLI_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}/brotli" \
        -DBROTLICOMMON_LIBRARY="${ANDROID_PREFIX_LIB}/libbrotlicommon.a" \
        -DBROTLIENC_LIBRARY="${ANDROID_PREFIX_LIB}/libbrotlienc.a" \
        -DBROTLIDEC_LIBRARY="${ANDROID_PREFIX_LIB}/libbrotlidec.a" \
        -DLCMS2_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DLCMS2_LIBRARY="${ANDROID_PREFIX_LIB}/liblcms2.a" \
        -DPNG_PNG_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}/png" \
        -DPNG_LIBRARY="${ANDROID_PREFIX_LIB}/libpng.a" \
        -DZLIB_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DZLIB_LIBRARY_RELEASE="${ANDROID_PREFIX_LIB}/libz.a" \
        -Wno-dev
    sed -i "s|liblcms2.a -lgdk_pixbuf-2.0 |liblcms2.a -L${ANDROID_PREFIX_LIB} -lgdk_pixbuf-2.0 |g" build-static/plugins/gdk-pixbuf/CMakeFiles/pixbufloader-jxl.dir/link.txt

    for f in "${patchUndefs[@]}"; do
        sed -i "s| -Wl,--no-undefined | |g" "build-static/${f}" || true
    done

    make -C build-static $MAKEFLAGS
}

package() {
    cd "${srcdir}/libjxl-${pkgver}"
    source android-env ${_android_arch}

    make -C build-shared DESTDIR="${pkgdir}" install
    make -C build-static DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    mv "${pkgdir}/${ANDROID_PREFIX_SHARE}/java"/{org.jpeg.jpegxl,jpegxl}.jar
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
