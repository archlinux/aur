# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

_android_arch=aarch64

pkgname=android-${_android_arch}-unixodbc
pkgver=2.3.14
pkgrel=2
arch=('any')
pkgdesc="ODBC is an open specification for providing application developers with a predictable API with which to access Data Sources (Android, ${_android_arch})"
license=('GPL2' 'LGPL2.1')
url="http://www.unixodbc.org/"
groups=('android-unixodbc')
depends=("android-${_android_arch}-libltdl")
options=(!strip !buildflags staticlibs !emptydirs)
source=("ftp://ftp.unixodbc.org/pub/unixODBC/unixODBC-${pkgver}.tar.gz")
md5sums=('316cede4896eb768fe4572d71dc04537')

build() {
    cd "${srcdir}/unixODBC-${pkgver}"
    source android-env ${_android_arch}

    if [ "${ANDROID_MINIMUM_PLATFORM}" -lt 24 ]; then
        if [[ "${_android_arch}" = armv7a-eabi || "${_android_arch}" = x86 ]]; then
            configopts=--disable-largefile
        fi
    fi

    android-${_android_arch}-configure \
        --disable-readline \
        ${configopts}
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/unixODBC-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_ETC}"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so

    install -vDm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
