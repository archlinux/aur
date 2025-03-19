# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

_android_arch=x86-64

pkgname=android-${_android_arch}-wavpack
pkgver=5.8.1
pkgrel=1
pkgdesc="Audio compression format with lossless, lossy and hybrid compression modes (Android ${_android_arch})"
arch=('any')
url="https://www.wavpack.com/"
license=('BSD')
groups=('android-wavpack')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/dbry/WavPack/releases/download/${pkgver}/wavpack-${pkgver}.tar.xz")
md5sums=('ff40072de82dd299fc45161bc46b8566')

prepare() {
    cd "${srcdir}/wavpack-${pkgver}"

    sed -i 's|-lpthread||g' configure
}

build() {
    cd "${srcdir}/wavpack-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --disable-asm \
        --disable-apps
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/wavpack-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
