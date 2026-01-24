# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

_android_arch=x86-64

pkgname=android-${_android_arch}-xkeyboard-config
pkgver=2.46
pkgrel=1
arch=('any')
pkgdesc="X keyboard configuration files (Android ${_android_arch})"
license=('LicenseRef-xkeyboard-config')
url="https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config"
groups=('android-xkeyboard-config')
makedepends=('android-meson'
             "android-${_android_arch}-libxslt"
             'python')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://xorg.freedesktop.org/archive/individual/data/xkeyboard-config/xkeyboard-config-${pkgver}.tar.xz")
md5sums=('ca851f0e5bc0f52f2fb4629babc344c1')

build() {
    cd "${srcdir}/xkeyboard-config-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-meson build \
        -D compat-rules=true \
        -D xorg-rules-symlinks=true
    ninja -C build
}

package() {
    cd "${srcdir}/xkeyboard-config-${pkgver}"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" ninja -C build install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}/man"

    install -vDm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
