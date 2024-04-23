# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Mladen Pejakovic <pejakm@gmail.com>

_android_arch=x86

pkgname=android-${_android_arch}-libxkbcommon
pkgver=1.7.0
pkgrel=1
arch=('any')
pkgdesc="Keymap handling library for toolkits and window systems (Android ${_android_arch})"
url='https://xkbcommon.org/'
license=('MIT')
depends=("android-${_android_arch}-xkeyboard-config"
         "android-${_android_arch}-libxml2")
makedepends=('meson'
             "android-${_android_arch}-libxcb"
             "android-${_android_arch}-xorgproto"
             "android-${_android_arch}-xkeyboard-config"
             "android-${_android_arch}-libxml2")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/xkbcommon/libxkbcommon/archive/refs/tags/xkbcommon-${pkgver}.tar.gz")
md5sums=('6e7451406b508833fb6afc423fbdc508')

build() {
    cd "${srcdir}/libxkbcommon-xkbcommon-${pkgver}"
    source android-env ${_android_arch}

    extra_options=

    if [ "${ANDROID_MINIMUM_PLATFORM}" -lt 28 ]; then
        extra_options="-D enable-x11=false"
    fi

    mkdir -p build && pushd build
    android-${_android_arch}-meson \
        -D enable-tools=false \
        -D enable-bash-completion=false \
        ${extra_options} \
        ..
    sed -i 's|-Wl,--no-undefined||g' build.ninja
    ninja
}

package() {
    cd "${srcdir}/libxkbcommon-xkbcommon-${pkgver}"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" ninja -C build install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
}
