# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

_android_arch=x86

pkgname=android-${_android_arch}-xkeyboard-config
pkgver=2.42
pkgrel=1
arch=('any')
pkgdesc="X keyboard configuration files (Android ${_android_arch})"
license=('LicenseRef-xkeyboard-config')
url="https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config"
makedepends=('android-meson'
             "android-${_android_arch}-libxslt"
             'python')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://xorg.freedesktop.org/archive/individual/data/xkeyboard-config/xkeyboard-config-${pkgver}.tar.xz")
sha256sums=('a6b06ebfc1f01fc505f2f05f265f95f67cc8873a54dd247e3c2d754b8f7e0807')

build() {
    cd "${srcdir}/xkeyboard-config-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-meson build \
        -D xkb-base="${ANDROID_PREFIX_SHARE}/X11/xkb" \
        -D compat-rules=true \
        -D xorg-rules-symlinks=true
    ninja -C build
}

package() {
    cd "${srcdir}/xkeyboard-config-${pkgver}"
    source android-env ${_android_arch}

    DESTDIR="$pkgdir" ninja -C build install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}/man"
}
