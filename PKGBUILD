# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_android_arch=x86

pkgname=android-${_android_arch}-fontconfig
pkgver=2.17.1
pkgrel=1
arch=('any')
pkgdesc="A library for configuring and customizing font access (Android ${_android_arch})"
url="https://www.freedesktop.org/wiki/Software/fontconfig/"
license=('custom')
groups=('android-fontconfig')
depends=("android-${_android_arch}-expat"
         "android-${_android_arch}-freetype2")
makedepends=('android-configure'
             'autoconf-archive'
             'gperf'
             'python-lxml'
             'json-c'
             'python-six')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://gitlab.freedesktop.org/fontconfig/fontconfig/-/archive/${pkgver}/fontconfig-${pkgver}.tar.gz")
md5sums=('1a1f5336105e5b80f36dce7dabe04d1a')

prepare() {
    cd "${srcdir}/fontconfig-${pkgver}"

    # do not build buggy test code
    sed -i /test\\/Makefile/d configure.ac
    sed -i "s/po-conf test/po-conf/g" Makefile.am
    rm -r test
    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "${srcdir}/fontconfig-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --disable-docs
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/fontconfig-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
