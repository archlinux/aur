# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_android_arch=aarch64

pkgname=android-${_android_arch}-openjpeg2
pkgver=2.4.0
pkgrel=1
arch=('any')
pkgdesc="An open source JPEG 2000 codec, version ${pkgver} (android)"
license=('BSD')
url="https://www.openjpeg.org"
depends=('android-ndk'
         "android-${_android_arch}-libpng"
         "android-${_android_arch}-lcms2")
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-cmake')
source=("https://github.com/uclouvain/openjpeg/archive/v${pkgver}.tar.gz")
md5sums=('4d388298335947367e91f1d100468af1')

build() {
    cd "${srcdir}"/openjpeg-${pkgver}
    source android-env ${_android_arch}

    mkdir "build-${_android_arch}-static" && pushd "build-${_android_arch}-static"
    android-${_android_arch}-cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_DOC=OFF \
    -DBUILD_TESTING=OFF \
    -DBUILD_SHARED_LIBS=OFF \
    ..
    make $MAKEFLAGS
    popd

    mkdir "build-${_android_arch}-shared" && pushd "build-${_android_arch}-shared"
    android-${_android_arch}-cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_DOC=OFF \
    -DBUILD_TESTING=OFF \
    -DBUILD_PKGCONFIG_FILES=ON \
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

    rm -r "${pkgdir}"/${ANDROID_PREFIX_BIN}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
