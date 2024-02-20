# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-p11-kit
pkgver=0.25.3
pkgrel=1
arch=('any')
pkgdesc="Loads and enumerates PKCS#11 modules (android)"
url="https://p11-glue.freedesktop.org"
license=('BSD')
depends=("android-${_android_arch}-libffi"
         "android-${_android_arch}-libtasn1")
makedepends=('android-meson')
options=(!strip !buildflags staticlibs !emptydirs)
source=(https://github.com/p11-glue/p11-kit/releases/download/$pkgver/p11-kit-$pkgver.tar.xz{,.sig})
b2sums=('5c695c1ef95edf4bbbab001aa634076c433df0bc89cb8104deaec2ce00c6908640e467755b49c6900e5d7d5d81e1a3871f4978a212c6f6ae088386ac0b95289a'
        'SKIP')
validpgpkeys=(
    C0F67099B808FB063E2C81117BFB1108D92765AF  # Stef Walter <stef@thewalter.net>
    462225C3B46F34879FC8496CD605848ED7E69871  # Daiki Ueno <ueno@unixuser.org>
    5D46CB0F763405A7053556F47A75A648B3F9220C  # Zoltan Fridrich <zfridric@redhat.com>
)

build() {
    cd "${srcdir}/p11-kit-${pkgver}"
    source android-env ${_android_arch}

    mkdir -p build && pushd build
    android-${_android_arch}-meson \
        -D gtk_doc=false \
        -D man=false \
        ..
    ninja
}

package() {
    cd "${srcdir}/p11-kit-${pkgver}"
    source android-env ${_android_arch}

    meson install -C build --destdir "$pkgdir"
    rm -rf "$pkgdir/${ANDROID_PREFIX_BIN}"
    rm -rf "$pkgdir/${ANDROID_PREFIX_ETC}"
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a || true
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
}
