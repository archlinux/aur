# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: drakkan <nicola.murino at gmail dot com>

_android_arch=aarch64

pkgname=android-${_android_arch}-libpsl
pkgver=0.21.5
pkgrel=1
arch=('any')
pkgdesc='Public Suffix List library (android)'
url='https://github.com/rockdaboot/libpsl'
license=('MIT')
depends=("android-${_android_arch}-libidn2"
         "android-${_android_arch}-libunistring")
makedepends=('android-meson'
             "android-${_android_arch}-libxslt")
options=(!strip !buildflags staticlibs !emptydirs)
source=(https://github.com/rockdaboot/libpsl/releases/download/${pkgver}/libpsl-${pkgver}.tar.gz)
sha512sums=('c14d575cecc0f1693894dd79565b6b9220084ddfa43b908a1cefe16d147cdd5ec47796eb0c2135e2f829a951abaf39d8a371ab5c1352f57b36e610e25adf91f5')

build() {
    cd "${srcdir}/libpsl-${pkgver}"
    source android-env ${_android_arch}

    mkdir -p build && pushd build
    android-${_android_arch}-meson \
        -D strip=true \
        -D docs=false \
        -D tests=false \
        -D runtime=libidn2 \
        ..
    ninja
    popd
}

package() {
    cd "${srcdir}/libpsl-${pkgver}"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" ninja -C "${srcdir}/libpsl-${pkgver}/build" install

    rm -rf "$pkgdir/${ANDROID_PREFIX_BIN}"
    rm -rf "$pkgdir/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a || true
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
}
