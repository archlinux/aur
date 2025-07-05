# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Mladen Pejakovic <pejakm@gmail.com>

_android_arch=x86

pkgname=android-${_android_arch}-libxkbcommon
pkgver=1.10.0
pkgrel=1
arch=('any')
pkgdesc="Keymap handling library for toolkits and window systems (Android ${_android_arch})"
url='https://xkbcommon.org/'
license=('MIT')
groups=('android-libxkbcommon')
depends=("android-${_android_arch}-xkeyboard-config"
         "android-${_android_arch}-libxml2")
makedepends=('android-meson'
             "android-${_android_arch}-libxcb"
             "android-${_android_arch}-xorgproto"
             "android-${_android_arch}-xkeyboard-config"
             "android-${_android_arch}-libxml2")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/xkbcommon/libxkbcommon/archive/refs/tags/xkbcommon-${pkgver}.tar.gz")
md5sums=('fff567d6841b9127477c303f1e8deb22')

build() {
    cd "${srcdir}/libxkbcommon-xkbcommon-${pkgver}"
    source android-env ${_android_arch}

    extra_options=

    if [ "${ANDROID_MINIMUM_PLATFORM}" -lt 28 ]; then
        extra_options="-D enable-x11=false"
    fi

    android-${_android_arch}-meson build \
        -D enable-tools=false \
        -D enable-bash-completion=false \
        ${extra_options}
    sed -i 's|-Wl,--no-undefined||g' build/build.ninja
    ninja -C build
}

package() {
    cd "${srcdir}/libxkbcommon-xkbcommon-${pkgver}"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" ninja -C build install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true
}
