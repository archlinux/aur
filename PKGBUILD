# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-openjpeg2
pkgver=2.5.2
pkgrel=2
arch=('any')
pkgdesc="An open source JPEG 2000 codec (Android ${_android_arch})"
license=('BSD')
url="https://www.openjpeg.org"
depends=('android-ndk'
         "android-${_android_arch}-libpng"
         "android-${_android_arch}-lcms2"
         'openjpeg2')
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/uclouvain/openjpeg/archive/v${pkgver}.tar.gz")
md5sums=('f9ee64845881a15109ed0aa73a12202f')

build() {
    cd "${srcdir}"/openjpeg-${pkgver}
    source android-env ${_android_arch}

    mkdir "build-${_android_arch}-static" && pushd "build-${_android_arch}-static"
    android-${_android_arch}-cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_DOC=OFF \
        -DBUILD_TESTING=OFF \
        -DBUILD_SHARED_LIBS=OFF \
        -DTIFF_LIBRARY="${ANDROID_PREFIX_LIB}/libtiff.a" \
        -DTIFF_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DLCMS2_LIBRARY="${ANDROID_PREFIX_LIB}/liblcms2.a" \
        -DLCMS2_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        ..
    make $MAKEFLAGS
    popd


    mkdir "build-${_android_arch}-shared" && pushd "build-${_android_arch}-shared"
    android-${_android_arch}-cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_DOC=OFF \
        -DBUILD_TESTING=OFF \
        -DBUILD_PKGCONFIG_FILES=ON \
        -DTIFF_LIBRARY="${ANDROID_PREFIX_LIB}/libtiff.so" \
        -DTIFF_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DLCMS2_LIBRARY="${ANDROID_PREFIX_LIB}/liblcms2.so" \
        -DLCMS2_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        ..
    make $MAKEFLAGS
    popd
}

package() {
    source android-env ${_android_arch}

    cd "${srcdir}/openjpeg-${pkgver}/build-${_android_arch}-static"
    make DESTDIR="$pkgdir" install
    cd "${srcdir}/openjpeg-${pkgver}/build-${_android_arch}-shared"
    make DESTDIR="$pkgdir" install

    # Link tools to our host versions
    rm -r "${pkgdir}"/${ANDROID_PREFIX_BIN}/*

    for f in opj_compress opj_decompress opj_dump; do
        ln -s "/usr/bin/$f" "$pkgdir/${ANDROID_PREFIX_BIN}/$f"
    done

    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
