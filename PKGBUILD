# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >
# Contributor: ant32 < antreimer at gmail dot com >

_android_arch=aarch64

pkgname=android-${_android_arch}-poppler
pkgver=24.02.0
pkgrel=1
arch=('any')
pkgdesc="PDF rendering library based on xpdf 3.0 (Android ${_android_arch})"
url="https://poppler.freedesktop.org"
license=('GPL-2.0-or-later')
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
             "android-${_android_arch}-libjpeg"
             "android-${_android_arch}-nss"
             "android-${_android_arch}-poppler-data"
             'gobject-introspection'
             'python')
optdepends=("android-${_android_arch}-glib2: libpoppler-glib")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://poppler.freedesktop.org/poppler-${pkgver}.tar.xz")
sha256sums=('19187a3fdd05f33e7d604c4799c183de5ca0118640c88b370ddcf3136343222e')

build() {
    cd "${srcdir}/poppler-${pkgver}"
    source android-env ${_android_arch}

    openjpeg_dir=$(ls "${ANDROID_PREFIX_LIB}/cmake" | grep openjpeg- | head -n 1)

    android-${_android_arch}-cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_CPP_TESTS=NO \
        -DBUILD_GTK_TESTS=NO \
        -DBUILD_QT5_TESTS=NO \
        -DENABLE_GTK_DOC=OFF \
        -DBUILD_MANUAL_TESTS=OFF \
        -DENABLE_BOOST=OFF \
        -DENABLE_NSS3=OFF \
        -DENABLE_GPGME=OFF \
        -DENABLE_QT5=OFF \
        -DENABLE_QT6=OFF \
        -DENABLE_UNSTABLE_API_ABI_HEADERS=ON \
        -DENABLE_UTILS=OFF \
        -DFREETYPE_INCLUDE_DIRS="${ANDROID_PREFIX_INCLUDE}/freetype2" \
        -DFREETYPE_LIBRARY="${ANDROID_PREFIX_LIB}/libfreetype.so" \
        -DJPEG_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DJPEG_LIBRARY_RELEASE="${ANDROID_PREFIX_LIB}/libjpeg.so" \
        -DPNG_LIBRARY="${ANDROID_PREFIX_LIB}/libpng.so" \
        -DPNG_PNG_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}/libpng" \
        -DTIFF_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DTIFF_LIBRARY="${ANDROID_PREFIX_LIB}/libtiff.so" \
        -DCAIRO_LIBRARIES="${ANDROID_PREFIX_LIB}/libcairo.so" \
        -DBoost_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DIconv_LIBRARY="${ANDROID_PREFIX_LIB}/libiconv.so" \
        -DOpenJPEG_DIR="${ANDROID_PREFIX_LIB}/cmake/$openjpeg_dir" \
        -DLCMS2_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DLCMS2_LIBRARIES:FILEPATH="${ANDROID_PREFIX_LIB}/liblcms2.so" \
        -DCURL_LIBRARY="${ANDROID_PREFIX_LIB}/libcurl.so" \
        -DCURL_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DENABLE_NSS3=ON \
        -DENABLE_GPGME=ON \
        -DGpgmepp_DIR="${ANDROID_PREFIX_LIB}/cmake/Gpgmepp" \
        -DENABLE_ZLIB_UNCOMPRESS=ON \
        -DZLIB_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DZLIB_LIBRARY="${ANDROID_PREFIX_LIB}/libz.so" \
        .
    sed -i 's| -lpthread | |g' CMakeFiles/poppler.dir/link.txt
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/poppler-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
}
