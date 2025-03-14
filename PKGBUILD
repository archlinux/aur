 # Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >
# Contributor: ant32 < antreimer at gmail dot com >

_android_arch=x86

pkgname=android-${_android_arch}-poppler
pkgver=25.02.0
pkgrel=1
arch=('any')
pkgdesc="PDF rendering library based on xpdf 3.0 (Android ${_android_arch})"
url="https://poppler.freedesktop.org"
license=('GPL-2.0-or-later')
groups=('android-poppler')
depends=("android-${_android_arch}-openjpeg2"
         "android-${_android_arch}-cairo")
makedepends=('android-cmake'
             "android-${_android_arch}-boost"
             "android-${_android_arch}-curl"
             "android-${_android_arch}-fontconfig"
             "android-${_android_arch}-glib2"
             "android-${_android_arch}-gpgme"
             "android-${_android_arch}-icu"
             "android-${_android_arch}-lcms2"
             "android-${_android_arch}-libassuan"
             "android-${_android_arch}-libjpeg"
             "android-${_android_arch}-nss"
             "android-${_android_arch}-poppler-data"
             'gobject-introspection'
             'python')
optdepends=("android-${_android_arch}-glib2: libpoppler-glib")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://poppler.freedesktop.org/poppler-${pkgver}.tar.xz"
        '0001-Fix-missing-variable.patch')
md5sums=('feae5e0715ed7738fcb4220730a3ff4c'
         '54008d1b6afe745d2a848cabad911b58')

prepare() {
    cd "${srcdir}/poppler-${pkgver}"

    patch -Np1 -i ../0001-Fix-missing-variable.patch
}

build() {
    cd "${srcdir}/poppler-${pkgver}"
    source android-env ${_android_arch}

    openjpeg_dir=$(ls "${ANDROID_PREFIX_LIB}/cmake" | grep openjpeg- | head -n 1)
    boost_dir=$(ls "${ANDROID_PREFIX_LIB}/cmake" | grep Boost- | head -n 1)
    boost_dir=$(ls "${ANDROID_PREFIX_LIB}/cmake" | grep Boost- | head -n 1)
    boost_headers_dir=$(ls "${ANDROID_PREFIX_LIB}/cmake" | grep boost_headers- | head -n 1)

    android-${_android_arch}-cmake \
        -S . \
        -B build-shared \
        -DBUILD_SHARED_LIBS=ON \
        -DBUILD_TESTING=OFF \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_CPP_TESTS=NO \
        -DBUILD_GTK_TESTS=NO \
        -DBUILD_QT5_TESTS=NO \
        -DENABLE_GTK_DOC=OFF \
        -DBUILD_MANUAL_TESTS=OFF \
        -DENABLE_ZLIB_UNCOMPRESS=ON \
        -DENABLE_BOOST=ON \
        -DENABLE_NSS3=ON \
        -DENABLE_GPGME=ON \
        -DENABLE_QT5=OFF \
        -DENABLE_QT6=OFF \
        -DENABLE_UNSTABLE_API_ABI_HEADERS=ON \
        -DENABLE_UTILS=OFF \
        -DBoost_DIR="${ANDROID_PREFIX_LIB}/cmake/${boost_dir}" \
        -Dboost_headers_DIR="${ANDROID_PREFIX_LIB}/cmake/${boost_headers_dir}" \
        -DFREETYPE_INCLUDE_DIRS="${ANDROID_PREFIX_INCLUDE}/freetype2" \
        -DFREETYPE_LIBRARY="${ANDROID_PREFIX_LIB}/libfreetype.so" \
        -DJPEG_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DJPEG_LIBRARY_RELEASE="${ANDROID_PREFIX_LIB}/libjpeg.so" \
        -DPNG_PNG_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}/libpng16" \
        -DPNG_LIBRARY="${ANDROID_PREFIX_LIB}/libpng.so" \
        -DTIFF_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DTIFF_LIBRARY="${ANDROID_PREFIX_LIB}/libtiff.so" \
        -DCAIRO_LIBRARIES="${ANDROID_PREFIX_LIB}/libcairo.so" \
        -DBoost_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DIconv_LIBRARY="${ANDROID_PREFIX_LIB}/libiconv.so" \
        -DOpenJPEG_DIR="${ANDROID_PREFIX_LIB}/cmake/${openjpeg_dir}" \
        -DLCMS2_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DLCMS2_LIBRARIES:FILEPATH="${ANDROID_PREFIX_LIB}/liblcms2.so" \
        -DCURL_LIBRARY="${ANDROID_PREFIX_LIB}/libcurl.so" \
        -DCURL_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DGpgmepp_DIR="${ANDROID_PREFIX_LIB}/cmake/Gpgmepp" \
        -DZLIB_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DZLIB_LIBRARY="${ANDROID_PREFIX_LIB}/libz.so" \
        -Wno-dev
    sed -i 's| -lpthread | |g' build-shared/CMakeFiles/poppler.dir/link.txt
    make -C build-shared $MAKEFLAGS

    android-${_android_arch}-cmake \
        -S . \
        -B build-static \
        -DBUILD_SHARED_LIBS=OFF \
        -DBUILD_TESTING=OFF \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_CPP_TESTS=NO \
        -DBUILD_GTK_TESTS=NO \
        -DBUILD_QT5_TESTS=NO \
        -DENABLE_GTK_DOC=OFF \
        -DBUILD_MANUAL_TESTS=OFF \
        -DENABLE_ZLIB_UNCOMPRESS=ON \
        -DENABLE_BOOST=ON \
        -DENABLE_NSS3=ON \
        -DENABLE_GPGME=ON \
        -DENABLE_QT5=OFF \
        -DENABLE_QT6=OFF \
        -DENABLE_UNSTABLE_API_ABI_HEADERS=ON \
        -DENABLE_UTILS=OFF \
        -DBoost_DIR="${ANDROID_PREFIX_LIB}/cmake/${boost_dir}" \
        -Dboost_headers_DIR="${ANDROID_PREFIX_LIB}/cmake/${boost_headers_dir}" \
        -DFREETYPE_INCLUDE_DIRS="${ANDROID_PREFIX_INCLUDE}/freetype2" \
        -DFREETYPE_LIBRARY="${ANDROID_PREFIX_LIB}/libfreetype.a" \
        -DJPEG_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DJPEG_LIBRARY_RELEASE="${ANDROID_PREFIX_LIB}/libjpeg.a" \
        -DPNG_PNG_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}/libpng16" \
        -DPNG_LIBRARY="${ANDROID_PREFIX_LIB}/libpng.a" \
        -DTIFF_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DTIFF_LIBRARY="${ANDROID_PREFIX_LIB}/libtiff.a" \
        -DCAIRO_LIBRARIES="${ANDROID_PREFIX_LIB}/libcairo.a" \
        -DBoost_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DIconv_LIBRARY="${ANDROID_PREFIX_LIB}/libiconv.a" \
        -DOpenJPEG_DIR="${ANDROID_PREFIX_LIB}/cmake/${openjpeg_dir}" \
        -DLCMS2_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DLCMS2_LIBRARIES:FILEPATH="${ANDROID_PREFIX_LIB}/liblcms2.a" \
        -DCURL_LIBRARY="${ANDROID_PREFIX_LIB}/libcurl.a" \
        -DCURL_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DGpgmepp_DIR="${ANDROID_PREFIX_LIB}/cmake/Gpgmepp" \
        -DZLIB_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DZLIB_LIBRARY="${ANDROID_PREFIX_LIB}/libz.a" \
        -Wno-dev
    sed -i 's| -lpthread | |g' build-static/CMakeFiles/poppler.dir/link.txt
    make -C build-static $MAKEFLAGS
}

package() {
    cd "${srcdir}/poppler-${pkgver}"
    source android-env ${_android_arch}

    make -C build-shared DESTDIR="${pkgdir}" install
    make -C build-static DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
