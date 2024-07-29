# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-p11-kit
pkgver=0.25.3
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
source=("https://github.com/p11-glue/p11-kit/releases/download/${pkgver}/p11-kit-${pkgver}.tar.xz"{,.sig})
md5sums=('2610cef2951d83d7037577eaae1acb54'
         'SKIP')
validpgpkeys=(
    'C0F67099B808FB063E2C81117BFB1108D92765AF'  # Stef Walter <stef@thewalter.net>
    '462225C3B46F34879FC8496CD605848ED7E69871'  # Daiki Ueno <ueno@unixuser.org>
    '5D46CB0F763405A7053556F47A75A648B3F9220C'  # Zoltan Fridrich <zfridric@redhat.com>
)

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
}
