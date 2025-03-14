# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_android_arch=x86-64

pkgname=android-${_android_arch}-openjpeg2
pkgver=2.5.3
pkgrel=1
arch=('any')
pkgdesc="An open source JPEG 2000 codec (Android ${_android_arch})"
license=('BSD')
url="https://www.openjpeg.org"
groups=('android-openjpeg2')
depends=('android-ndk'
         "android-${_android_arch}-libpng"
         "android-${_android_arch}-lcms2"
         'openjpeg2')
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/uclouvain/openjpeg/archive/v${pkgver}.tar.gz")
md5sums=('12ae257cb21738c41b5f6ca977d01081')

build() {
    cd "${srcdir}/openjpeg-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build-shared \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_DOC=OFF \
        -DBUILD_TESTING=OFF \
        -DBUILD_SHARED_LIBS=ON \
        -DBUILD_PKGCONFIG_FILES=ON \
        -DTIFF_LIBRARY="${ANDROID_PREFIX_LIB}/libtiff.so" \
        -DTIFF_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DLCMS2_LIBRARY="${ANDROID_PREFIX_LIB}/liblcms2.so" \
        -DLCMS2_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}"
    make -C build-shared $MAKEFLAGS

    android-${_android_arch}-cmake \
        -S . \
        -B build-static \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_DOC=OFF \
        -DBUILD_TESTING=OFF \
        -DBUILD_SHARED_LIBS=OFF \
        -DTIFF_LIBRARY="${ANDROID_PREFIX_LIB}/libtiff.a" \
        -DTIFF_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DLCMS2_LIBRARY="${ANDROID_PREFIX_LIB}/liblcms2.a" \
        -DLCMS2_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}"
    make -C build-static $MAKEFLAGS
}

package() {
    cd "${srcdir}/openjpeg-${pkgver}"
    source android-env ${_android_arch}

    make -C build-shared DESTDIR="${pkgdir}" install
    make -C build-static DESTDIR="${pkgdir}" install

    # Link tools to our host versions
    rm -r "${pkgdir}/${ANDROID_PREFIX_BIN}"/*

    for f in opj_compress opj_decompress opj_dump; do
        ln -s "/usr/bin/$f" "${pkgdir}/${ANDROID_PREFIX_BIN}/$f"
    done

    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
