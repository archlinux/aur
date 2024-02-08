# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: drakkan <nicola.murino at gmail dot com>

_android_arch=x86

pkgname=android-${_android_arch}-libffi
pkgver=3.4.4
pkgrel=1
arch=('any')
pkgdesc="Portable foreign function interface library (android)"
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
license=('MIT')
url="http://sourceware.org/libffi"
source=("https://github.com/libffi/libffi/releases/download/v$pkgver/libffi-$pkgver.tar.gz"
        '0001-Fix-missing-declaration.patch'
        '0002-Force-x86-compile.patch')
sha256sums=('d66c56ad259a82cf2a9dfc408b32bf5da52371500b84745f7fb8b645712df676'
            'eb63525f454b0563f28fcd26a887f6e27fb7773dce706658d5a25500e0c10615'
            '40c34ca6e147b571bce4c6d3523992543086ca2c48cc0fdf17a19a8ed5373e95')

prepare () {
    cd "${srcdir}/libffi-${pkgver}"
    patch -Np1 -i "../0001-Fix-missing-declaration.patch"
    patch -Np1 -i "../0002-Force-x86-compile.patch"
}

build() {
    cd "${srcdir}/libffi-${pkgver}"
    source android-env ${_android_arch}

    # Platform specific patches
    case "$_android_arch" in
        armv7a-eabi | x86)
            export LDFLAGS="-Wl,--undefined-version ${LDFLAGS}"
            ;;
    esac

    android-${_android_arch}-configure \
        --disable-docs \
        --enable-pax_emutramp
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libffi-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -rf "${pkgdir}"/${ANDROID_PREFIX_SHARE}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
