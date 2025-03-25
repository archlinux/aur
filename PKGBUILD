# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

_android_arch=x86-64

pkgname=android-${_android_arch}-pugixml
pkgver=1.15
pkgrel=1
arch=('any')
pkgdesc="Light-weight, simple and fast XML parser for C++ with XPath support (Android ${_android_arch})"
url="https://pugixml.org"
license=('MIT')
groups=('android-pugixml')
depends=('android-ndk')
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/zeux/pugixml/releases/download/v${pkgver}/pugixml-${pkgver}.tar.gz")
md5sums=('3b894c29455eb33a40b165c6e2de5895')

build() {
    cd "${srcdir}/pugixml-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build-shared \
        -DBUILD_SHARED_LIBS=ON \
        -Wno-dev
    make -C build-shared $MAKEFLAGS

    android-${_android_arch}-cmake \
        -S . \
        -B build-static \
        -DBUILD_SHARED_LIBS=OFF \
        -Wno-dev
    make -C build-static $MAKEFLAGS
}

package() {
    cd "${srcdir}/pugixml-${pkgver}"
    source android-env ${_android_arch}

    make -C build-shared DESTDIR="${pkgdir}" install
    make -C build-static DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a

    install -vDm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/$pkgname/"
}
