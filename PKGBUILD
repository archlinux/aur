# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: damir <damir@archlinux.org>

_android_arch=aarch64

pkgname=android-${_android_arch}-mpfr
_pkgver=4.2.2
_patchver=0

if (( _patchver == 0 )); then
    pkgver=$_pkgver
else
    pkgver=$_pkgver.p$_patchver
fi

pkgrel=1
arch=('any')
pkgdesc="Multiple-precision floating-point library (Android ${_android_arch})"
url='https://www.mpfr.org/'
license=('GPL-3.0-or-later'
         'LGPL-3.0-or-later')
groups=('android-mpfr')
depends=("android-${_android_arch}-gmp")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
# NOTE: download potentially existing patches from upstream:
# `curl patches.diff -o https://www.mpfr.org/mpfr-${_pkgver}/allpatches`
source=("https://ftp.gnu.org/gnu/mpfr/mpfr-${_pkgver}.tar.xz"{,.sig})
md5sums=('7c32c39b8b6e3ae85f25156228156061'
         'SKIP')
validpgpkeys=('07F3DBBECC1A39605078094D980C197698C3739D'
              'A534BE3F83E241D918280AEB5831D11A0D4DB02A') # Vincent Lefevre <vincent@vinc17.net>

prepare() {
    cd "${srcdir}/mpfr-${_pkgver}"
    source android-env ${_android_arch}

    for src in "${source[@]}"; do
        [[ "$src" == *.diff ]] || [[ "$src" == *.patch ]] || continue
        printf "Applying patch %s...\n" "$src"
        patch -Np1 -i "../$src"
    done

    autoreconf -fiv
}

build() {
    cd "${srcdir}/mpfr-${_pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --enable-thread-safe
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/mpfr-${_pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
