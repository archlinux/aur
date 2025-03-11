# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: drakkan <nicola.murino at gmail dot com>

_android_arch=x86

pkgname=android-${_android_arch}-libpsl
pkgver=0.21.5
pkgrel=2
arch=('any')
pkgdesc="Public Suffix List library (Android ${_android_arch})"
url='https://github.com/rockdaboot/libpsl'
license=('MIT')
groups=('android-libpsl')
depends=("android-${_android_arch}-libidn2"
         "android-${_android_arch}-libunistring")
makedepends=('android-meson'
             "android-${_android_arch}-libxslt")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/rockdaboot/libpsl/releases/download/${pkgver}/libpsl-${pkgver}.tar.gz")
md5sums=('870a798ee9860b6e77896548428dba7b')

build() {
    cd "${srcdir}/libpsl-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-meson build \
        -D strip=true \
        -D docs=false \
        -D tests=false \
        -D runtime=libidn2
    ninja -C build
}

package() {
    cd "${srcdir}/libpsl-${pkgver}"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" ninja install -C build
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
}
