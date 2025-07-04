# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_android_arch=riscv64

pkgbase=android-${_android_arch}-harfbuzz
pkgname=("android-${_android_arch}-harfbuzz"
         "android-${_android_arch}-harfbuzz-icu")
pkgver=11.2.1
pkgrel=1
pkgdesc="OpenType text shaping engine (Android ${_android_arch})"
arch=('any')
license=('MIT')
url="https://www.freedesktop.org/wiki/Software/HarfBuzz"
groups=('android-harfbuzz')
depends=("android-${_android_arch}-glib2"
         "android-${_android_arch}-graphite"
         "android-${_android_arch}-freetype2")
makedepends=('android-meson'
             "android-${_android_arch}-cairo"
             "android-${_android_arch}-icu"
             'python'
             'ragel')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/harfbuzz/harfbuzz/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('d286c7ba7d7a4c1c59a5579dbcec1a1d')

build() {
    cd "${srcdir}/harfbuzz-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-meson build-shared \
        -D b_lto=false \
        -D graphite=enabled \
        -D tests=disabled \
        -D docs=disabled
    sed -i 's|-Wl,--no-undefined||g' build-shared/build.ninja
    ninja -C build-shared

    android-${_android_arch}-meson build-static \
        --default-library static \
        -D b_lto=false \
        -D graphite=enabled \
        -D tests=disabled \
        -D docs=disabled
    sed -i 's|-Wl,--no-undefined||g' build-static/build.ninja
    ninja -C build-static
}

package_android-riscv64-harfbuzz() {
    cd "${srcdir}/harfbuzz-${pkgver}"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" ninja -C build-shared install
    DESTDIR="${pkgdir}" ninja -C build-static install

    cp "src/hb-ft.h" "${pkgdir}/${ANDROID_PREFIX_INCLUDE}/harfbuzz/"
    rm -r "${pkgdir}/${ANDROID_PREFIX_BIN}"
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so

    mkdir -p "hb-icu/${ANDROID_PREFIX}"/{include/harfbuzz,lib/pkgconfig}
    mv -vf "${pkgdir}/${ANDROID_PREFIX_LIB}"/libharfbuzz-icu* "hb-icu/${ANDROID_PREFIX_LIB}"
    mv -vf "${pkgdir}/${ANDROID_PREFIX_LIB}/pkgconfig/harfbuzz-icu.pc" "hb-icu/${ANDROID_PREFIX_LIB}/pkgconfig"
    mv -vf "${pkgdir}/${ANDROID_PREFIX_INCLUDE}/harfbuzz/hb-icu.h" "hb-icu/${ANDROID_PREFIX_INCLUDE}/harfbuzz"
}

package_android-riscv64-harfbuzz-icu() {
    pkgdesc="OpenType text shaping engine (ICU integration, Android ${_android_arch})"
    depends=("android-${_android_arch}-harfbuzz"
             "android-${_android_arch}-icu")

    mkdir -p "${pkgdir}/${ANDROID_PREFIX}"
    mv -vf "${srcdir}/harfbuzz-${pkgver}/hb-icu/${ANDROID_PREFIX}"/* "${pkgdir}/${ANDROID_PREFIX}"
 }
