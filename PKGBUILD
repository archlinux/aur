# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_android_arch=x86

pkgname=android-${_android_arch}-harfbuzz
pkgver=14.5.0
pkgrel=1
pkgdesc="OpenType text shaping engine (Android ${_android_arch})"
arch=('any')
license=('MIT')
url="https://www.freedesktop.org/wiki/Software/HarfBuzz"
groups=('android-harfbuzz')
depends=("android-ndk")
makedepends=('android-meson'
             'python'
             'ragel')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/harfbuzz/harfbuzz/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('62b68ab4305190bf5ac318fcc37c6d54')

build() {
    cd "${srcdir}/harfbuzz-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-meson build-shared \
        -D b_lto=false \
        -D cairo=disabled \
        -D freetype=disabled \
        -D gobject=disabled \
        -D glib=disabled \
        -D graphite=disabled \
        -D icu=disabled \
        -D tests=disabled \
        -D utilities=disabled \
        -D docs=disabled
    sed -i 's|-Wl,--no-undefined||g' build-shared/build.ninja
    ninja -C build-shared

    android-${_android_arch}-meson build-static \
        --default-library static \
        -D b_lto=false \
        -D cairo=disabled \
        -D freetype=disabled \
        -D gobject=disabled \
        -D glib=disabled \
        -D graphite=disabled \
        -D icu=disabled \
        -D tests=disabled \
        -D utilities=disabled \
        -D docs=disabled
    sed -i 's|-Wl,--no-undefined||g' build-static/build.ninja
    ninja -C build-static
}

package() {
    cd "${srcdir}/harfbuzz-${pkgver}"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" ninja -C build-shared install
    DESTDIR="${pkgdir}" ninja -C build-static install

    cp "src/hb-ft.h" "${pkgdir}/${ANDROID_PREFIX_INCLUDE}/harfbuzz/"
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so

    install -vDm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
