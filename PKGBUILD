# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: David Runge <dvzrv@archlinux.org>

_android_arch=x86-64

pkgname=android-${_android_arch}-openpmix
pkgver=4.2.9
pkgrel=3
arch=('any')
pkgdesc="Extended version of the PMI standard (Android, ${_android_arch})"
url="https://github.com/openpmix/openpmix"
license=('BSD-3-Clause')
depends=("android-${_android_arch}-hwloc"
         "android-${_android_arch}-libevent"
         "android-${_android_arch}-zlib")
makedepends=("android-${_android_arch}-hwloc"
             "android-${_android_arch}-zlib"
             'android-environment'
             'perl'
             'python')
options=(!strip !buildflags staticlibs !emptydirs)
source=("$url/releases/download/v$pkgver/pmix-$pkgver.tar.gz"
        '0001-Force-32-bits-compile.patch'
        '0002-Unversioned-libs.patch')
md5sums=('6ef6da8a14d670712431fd62194bd390'
         'd0032b4f6868acb7b3a593f1a76f0eed'
         '47db6b8ab5894753aa4c508f64c75389')

prepare() {
    cd "${srcdir}/pmix-$pkgver"
    source android-env ${_android_arch}

    ./autogen.pl

    patch -Np1 -i ../0001-Force-32-bits-compile.patch
    patch -Np1 -i ../0002-Unversioned-libs.patch
    sed -i 's|-lpthread||g' configure
}

build() {
    cd "${srcdir}/pmix-$pkgver"
    source android-env ${_android_arch}

    # set environment variables for reproducible build
    # see https://docs.openpmix.org/en/latest/release-notes/general.html
    export HOSTNAME=buildhost
    export USER=builduser

    # Platform specific patches
    case "$_android_arch" in
        aarch64)
             host=armv8-unknown-linux
            ;;
        armv7a-eabi)
             host=armv7-unknown-linux
            ;;
        x86)
             host=x86-unknown-linux
            ;;
        x86-64)
             host=x86_64-unknown-linux
            ;;
        *)
            ;;
    esac

    ./configure \
        --host=${host} \
        --prefix=${ANDROID_PREFIX} \
        --libdir=${ANDROID_PREFIX_LIB} \
        --includedir=${ANDROID_PREFIX_INCLUDE} \
        --enable-shared \
        --enable-static \
        --sysconfdir="${ANDROID_PREFIX_ETC}/openpmix"
    make V=1 $MAKEFLAGS
}

package() {
    cd "${srcdir}/pmix-$pkgver"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
    rm -f "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so.*
}
