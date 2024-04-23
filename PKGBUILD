# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

_android_arch=x86-64

pkgname=android-${_android_arch}-xkeyboard-config
pkgver=2.41
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
sha256sums=('f02cd6b957295e0d50236a3db15825256c92f67ef1f73bf1c77a4b179edf728f')

build() {
    cd "${srcdir}/xkeyboard-config-${pkgver}"
    source android-env ${_android_arch}

    mkdir -p build && pushd build
    android-${_android_arch}-meson \
        -D xkb-base="${ANDROID_PREFIX_SHARE}/X11/xkb" \
        -D compat-rules=true \
        -D xorg-rules-symlinks=true \
        ..
    ninja
}

package() {
    cd "${srcdir}/xkeyboard-config-${pkgver}"
    source android-env ${_android_arch}

    DESTDIR="$pkgdir" ninja -C build install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}/man"
}
