# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Ionut Biru <ionut@archlinux.ro>
# Contributor: WAntilles <wantilles@adslgr.com>

_android_arch=riscv64

pkgname=android-${_android_arch}-opencore-amr
pkgver=0.1.6
pkgrel=2
arch=('any')
pkgdesc="Open source implementation of the Adaptive Multi Rate (AMR) speech codec (Android ${_android_arch})"
license=('Apache')
url="https://sourceforge.net/projects/opencore-amr/"
groups=('android-opencore-amr')
depends=('android-ndk')
makedepends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://downloads.sourceforge.net/sourceforge/opencore-amr/opencore-amr-$pkgver.tar.gz")
md5sums=('03de025060a4f16c4c44218f65e13e95')

prepare() {
    cd "${srcdir}/opencore-amr-${pkgver}"
    source android-env ${_android_arch}

    autoreconf -fiv
}

build() {
    cd "${srcdir}/opencore-amr-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure
    # prevent excessive overlinking due to libtool
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/opencore-amr-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
