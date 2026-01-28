# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-p11-kit
pkgver=0.26.1
pkgrel=1
arch=('any')
pkgdesc="Loads and enumerates PKCS#11 modules (Android ${_android_arch})"
url="https://p11-glue.freedesktop.org"
license=('BSD')
groups=('android-p11-kit')
depends=("android-${_android_arch}-libffi"
         "android-${_android_arch}-libtasn1")
makedepends=('android-meson')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/p11-glue/p11-kit/releases/download/${pkgver}/p11-kit-${pkgver}.tar.xz")
md5sums=('c5ef8b487869233ba58973a91dcfdf26')

build() {
    cd "${srcdir}/p11-kit-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-meson build \
        -Dgtk_doc=false \
        -Dman=false \
        -Dtest=false \
        -Dpost_install_test=false
    ninja -C build
}

package() {
    cd "${srcdir}/p11-kit-${pkgver}"
    source android-env ${_android_arch}

    meson install -C build --destdir "${pkgdir}"
    rm -rf "$pkgdir/${ANDROID_PREFIX_BIN}"
    rm -rf "$pkgdir/${ANDROID_PREFIX_ETC}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true

    install -vDm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
