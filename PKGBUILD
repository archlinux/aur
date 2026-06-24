# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

_android_arch=riscv64

pkgname=android-${_android_arch}-faac
pkgver=1.50
pkgrel=1
arch=('any')
pkgdesc="Freeware Advanced Audio Coder (Android ${_android_arch})"
url="https://www.audiocoding.com/"
license=('GPL2'
         'custom')
groups=('android-faac')
depends=('android-ndk')
makedepends=('android-meson')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/knik0/faac/archive/refs/tags/faac-${pkgver}.tar.gz")
md5sums=('10a90885ef4d6b521b22e9ed7ecf9992')

build() {
    cd "${srcdir}/faac-faac-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-meson build \
        -D frontend=false
    meson compile -C build
}

package() {
    cd "${srcdir}/faac-faac-${pkgver}"
    source android-env ${_android_arch}

    meson install -C build --destdir "${pkgdir}"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true

    install -vDm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
