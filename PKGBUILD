# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: drakkan <nicola.murino at gmail dot com>

_android_arch=riscv64

pkgname=android-${_android_arch}-libffi
pkgver=3.5.1
pkgrel=1
arch=('any')
pkgdesc="Portable foreign function interface library (Android ${_android_arch})"
groups=('android-libffi')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
license=('MIT')
url="http://sourceware.org/libffi"
source=("https://github.com/libffi/libffi/releases/download/v${pkgver}/libffi-${pkgver}.tar.gz"
        '0001-Fix-missing-declaration.patch'
        '0002-Force-x86-compile.patch')
md5sums=('a67b82e7ec069f15cd81c23ced5049f4'
         'b8307ef703dd12d25acfd998d005e9b2'
         'fe386b633751ef1f9474e54610add89e')

prepare () {
    cd "${srcdir}/libffi-${pkgver}"
    patch -Np1 -i ../0001-Fix-missing-declaration.patch
    patch -Np1 -i ../0002-Force-x86-compile.patch
}

build() {
    cd "${srcdir}/libffi-${pkgver}"
    source android-env ${_android_arch}

    # Platform specific patches
    case "${_android_arch}" in
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

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
