# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_android_arch=aarch64

pkgbase=android-${_android_arch}-harfbuzz
pkgname=("android-${_android_arch}-harfbuzz"
         "android-${_android_arch}-harfbuzz-icu")
pkgver=8.3.0
pkgrel=1
arch=('any')
pkgdesc="OpenType text shaping engine (android)"
depends=("android-${_android_arch}-glib2"
         "android-${_android_arch}-graphite"
         "android-${_android_arch}-freetype2")
makedepends=('android-meson'
             "android-${_android_arch}-cairo"
             "android-${_android_arch}-icu"
             'python'
             'ragel')
options=(!strip !buildflags staticlibs !emptydirs)
license=('MIT')
url="https://www.freedesktop.org/wiki/Software/HarfBuzz"
source=("https://github.com/harfbuzz/harfbuzz/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6a093165442348d99f3307480ea87ed83bdabaf642cdd9548cff6b329e93bfac')

build() {
    cd "${srcdir}/harfbuzz-${pkgver}"
    source android-env ${_android_arch}

    mkdir -p build-${_android_arch}-shared && pushd build-${_android_arch}-shared
    android-${_android_arch}-meson \
        -D b_lto=false \
        -D graphite=enabled \
        -D tests=disabled \
        -D docs=disabled \
        ..
    ninja

    popd
    mkdir -p build-${_android_arch}-static && pushd build-${_android_arch}-static
    android-${_android_arch}-meson \
        --default-library static \
        -D b_lto=false \
        -D graphite=enabled \
        -D tests=disabled \
        -D docs=disabled \
        ..
    ninja
    popd
}

package_android-aarch64-harfbuzz() {
    source android-env ${_android_arch}

    cd "${srcdir}/harfbuzz-${pkgver}/build-${_android_arch}-static"
    DESTDIR="${pkgdir}" ninja install
    cd "${srcdir}/harfbuzz-${pkgver}/build-${_android_arch}-shared"
    DESTDIR="${pkgdir}" ninja install

    cp "${srcdir}/harfbuzz-${pkgver}/src/hb-ft.h" "${pkgdir}/${ANDROID_PREFIX_INCLUDE}/harfbuzz/"
    rm -r "${pkgdir}"/${ANDROID_PREFIX_BIN}
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a || true
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so

    mkdir -p "${srcdir}/harfbuzz-${pkgver}/hb-icu"/${ANDROID_PREFIX}/{include/harfbuzz,lib/pkgconfig}
    mv -vf "${pkgdir}/${ANDROID_PREFIX_LIB}"/libharfbuzz-icu* "${srcdir}/harfbuzz-${pkgver}/hb-icu/${ANDROID_PREFIX_LIB}"
    mv -vf "${pkgdir}/${ANDROID_PREFIX_LIB}"/pkgconfig/harfbuzz-icu.pc "${srcdir}/harfbuzz-${pkgver}/hb-icu/${ANDROID_PREFIX_LIB}/pkgconfig"
    mv -vf "${pkgdir}/${ANDROID_PREFIX_INCLUDE}"/harfbuzz/hb-icu.h "${srcdir}/harfbuzz-${pkgver}/hb-icu/${ANDROID_PREFIX_INCLUDE}/harfbuzz"
}

package_android-aarch64-harfbuzz-icu() {
    pkgdesc="OpenType text shaping engine (ICU integration, android)"
    depends=("android-${_android_arch}-harfbuzz"
             "android-${_android_arch}-icu")

    mkdir -p "${pkgdir}/${ANDROID_PREFIX}"
    mv -vf "${srcdir}/harfbuzz-${pkgver}/hb-icu/${ANDROID_PREFIX}"/* "${pkgdir}/${ANDROID_PREFIX}"
 }
