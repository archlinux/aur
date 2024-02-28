# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Federico Quagliata (quaqo) <quaqo@despammed.com>

_android_arch=x86-64

pkgname=android-${_android_arch}-cracklib
pkgver=2.9.11
pkgrel=1
arch=('any')
pkgdesc="Password Checking Library (android)"
license=('GPL')
url="https://github.com/cracklib/cracklib"
depends=("android-${_android_arch}-zlib")
makedepends=("cracklib")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/cracklib/cracklib/releases/download/v$pkgver/cracklib-$pkgver.tar.gz")
sha256sums=('6213b986a5209fc0d4ca93734e349b8f66b36bfe9a3fae6eead14a15d82a68dc')

build() {
    cd "${srcdir}/cracklib-$pkgver"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --without-python
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/cracklib-$pkgver"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -rf "$pkgdir/${ANDROID_PREFIX}/sbin"
    rm -rf "$pkgdir/${ANDROID_PREFIX_SHARE}/man"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a

    # symlink cracklib-small #34778
    mkdir -p "$pkgdir/${ANDROID_PREFIX_SHARE}/dict"
    ln -sf ../cracklib/cracklib-small "$pkgdir/${ANDROID_PREFIX_SHARE}/dict/cracklib-small"
    cracklib-format dicts/cracklib-small \
        | cracklib-packer "$pkgdir/${ANDROID_PREFIX_SHARE}/cracklib/pw_dict"
}
