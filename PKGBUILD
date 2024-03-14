# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libsasl-bootstrap
pkgver=2.1.28
pkgrel=2
arch=('any')
pkgdesc="Cyrus Simple Authentication Service Layer (SASL) library (Android, ${_android_arch})"
url="https://www.cyrusimap.org/sasl/"
license=('custom')
groups=('android-libsasl-bootstrap')
depends=("android-${_android_arch}-gdbm"
         "android-${_android_arch}-openssl")
makedepends=('android-configure'
             "android-${_android_arch}-sqlite")
provides=("android-${_android_arch}-libsasl")
conflicts=("android-${_android_arch}-libsasl")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/cyrusimap/cyrus-sasl/releases/download/cyrus-sasl-$pkgver/cyrus-sasl-$pkgver.tar.gz"{,.sig}
        '0001-Add-missing-headers.patch'
        '0002-Disable-endpwent.patch')
md5sums=('6f228a692516f5318a64505b46966cfa'
         'SKIP'
         '15c03fcc850a6282adabc4f4d17cd517'
         'f4ff7c553efe884ee328167893005e11')
validpgpkeys=(
    '829F339F8C296FE80F409D93E3D7C118C7B9F46A'  # Partha Susarla <mail@spartha.org>
    'DEA1999F0CDB1AAEBA001E0DBEE3E3B4D2F06546'  # Quanah Gibson-Mount <quanah@fast-mail.org>
)

prepare() {
    cd "${srcdir}/cyrus-sasl-$pkgver"
    source android-env ${_android_arch}

    patch -Np1 -i ../0001-Add-missing-headers.patch

    if [ "${ANDROID_MINIMUM_PLATFORM}" -lt 26 ]; then
        patch -Np1 -i ../0002-Disable-endpwent.patch
    fi

    autoreconf -fiv
}

build() {
    cd "${srcdir}/cyrus-sasl-$pkgver"
    source android-env ${_android_arch}

    export CFLAGS="${CFLAGS} -DHAVE_TIME_H=1"
    export CXXFLAGS="${CXXFLAGS} -DHAVE_TIME_H=1"

    android-${_android_arch}-configure \
        --prefix="${ANDROID_PREFIX}" \
        --sysconfdir="${ANDROID_PREFIX_ETC}" \
        --infodir="${ANDROID_PREFIX_SHARE}/info" \
        --mandir="${ANDROID_PREFIX_SHARE}/man" \
        --sbin="${ANDROID_PREFIX_BIN}" \
        --with-configdir="${ANDROID_PREFIX_ETC}/sasl2:${ANDROID_PREFIX_ETC}/sasl:${ANDROID_PREFIX_LIB}/sasl2" \
        --enable-alwaystrue \
        --enable-anon \
        --enable-auth-sasldb \
        --enable-checkapop \
        --enable-cram \
        --enable-digest \
        --enable-gssapi \
        --enable-login \
        --enable-ntlm \
        --enable-plain \
        --enable-shared \
        --enable-sql \
        --disable-krb4 \
        --disable-macos-framework \
        --disable-otp \
        --disable-passdss \
        --disable-srp \
        --disable-srp-setpass \
        --disable-static \
        --disable-sample \
        --with-dblib=gdbm \
        --with-sqlite3="${ANDROID_PREFIX_INCLUDE}" \
        --without-mysql \
        --without-pgsql
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/cyrus-sasl-$pkgver"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/sasl2/*.so
}
