# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: David Runge <dvzrv@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-nlohmann-json
pkgver=3.11.3
pkgrel=1
arch=('any')
pkgdesc="JSON for Modern C++ (Android ${_android_arch})"
url="https://github.com/nlohmann/json"
license=('MIT')
groups=('android-nlohmann-json')
depends=('android-ndk')
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/nlohmann/json/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('d603041cbc6051edbaa02ebb82cf0aa9')

build() {
    cd "${srcdir}/json-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build \
        -DJSON_BuildTests=OFF \
        -DJSON_MultipleHeaders=ON \
        -Wno-dev
    make -C build $MAKEFLAGS
}

package() {
    cd "${srcdir}/json-${pkgver}"
    source android-env ${_android_arch}

    make -C build DESTDIR="${pkgdir}" install
    install -vDm 644 LICENSE.MIT -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
