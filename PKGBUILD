# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

_android_arch=x86

pkgname=android-${_android_arch}-openldap
pkgver=2.6.7
pkgrel=1
arch=('any')
pkgdesc="Lightweight Directory Access Protocol (LDAP) (Android, ${_android_arch})"
url="https://www.openldap.org/"
license=('custom')
groups=('android-openldap-bootstrap')
depends=("android-${_android_arch}-libsasl"
         "android-${_android_arch}-libtool"
         "android-${_android_arch}-unixodbc"
         "android-${_android_arch}-libsodium")
makedepends=('android-configure'
             'util-linux'
             'chrpath')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-${pkgver}.tgz")
sha256sums=('cd775f625c944ed78a3da18a03b03b08eea73c8aabc97b41bb336e9a10954930')

prepare() {
    cd "${srcdir}/openldap-$pkgver"
    source android-env ${_android_arch}

    autoconf -fiv
}

build() {
    cd "${srcdir}/openldap-$pkgver"
    source android-env ${_android_arch}

    export CFLAGS="${CFLAGS} -DMDB_USE_ROBUST=0"
    export CXXFLAGS="${CXXFLAGS} -DMDB_USE_ROBUST=0"
    export CPPFLAGS="${CXXFLAGS}"
    export AR=${ANDROID_AR}
    export STRIP=${ANDROID_STRIP}
    export OBJDUMP=${ANDROID_OBJDUMP}
    export RANLIB=${ANDROID_RANLIB}

    android-${_android_arch}-configure \
        --libexecdir="${ANDROID_PREFIX_LIB}" \
        --sysconfdir="${ANDROID_PREFIX_ETC}" \
        --localstatedir="${ANDROID_PREFIX_LIB}/openldap" \
        --sbindir="${ANDROID_PREFIX_BIN}" \
        --with-yielding_select=yes \
        --enable-slapd=no \
        --enable-dynamic \
        --enable-ipv6 \
        --enable-local \
        --enable-syslog \
        --with-argon2=libsodium \
        --with-cyrus-sasl
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/openldap-$pkgver"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -rf "${pkgdir}"/${ANDROID_PREFIX_BIN}
    rm -rf "${pkgdir}"/${ANDROID_PREFIX_SHARE}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
