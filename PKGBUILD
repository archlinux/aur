# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>

_android_arch=aarch64

pkgname=android-${_android_arch}-lv2
pkgver=1.18.10
pkgrel=1
arch=('any')
pkgdesc="Plugin standard for audio systems (Android ${_android_arch})"
url="https://lv2plug.in/"
license=('ISC')
depends=('android-ndk')
makedepends=('android-meson'
             "android-${_android_arch}-libsamplerate"
             "android-${_android_arch}-libsndfile"
             "android-${_android_arch}-serd"
             "android-${_android_arch}-sord")
optdepends=("android-${_android_arch}-sord: for lv2_validate")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://lv2plug.in/spec/lv2-$pkgver.tar.xz"{,.sig})
md5sums=('9c1f3143ea2eea341e8d6e1bad9e5e0e'
         'SKIP')
validpgpkeys=('907D226E7E13FA337F014A083672782A9BF368F3') # David Robillard <d@drobilla.net>

build() {
    cd "${srcdir}/lv2-${pkgver}"
    source android-env ${_android_arch}

    mkdir -p build
    cd build
    android-${_android_arch}-meson \
        --default-library both \
        -D docs=disabled \
        -D online_docs=false \
        -D plugins=disabled \
        -D tests=disabled
    ninja
}

package() {
    cd "${srcdir}/lv2-${pkgver}/build"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" ninja install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
}
