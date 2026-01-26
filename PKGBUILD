# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Dan McGee <dan@archlinux.org>

_android_arch=x86

pkgname=android-${_android_arch}-postgresql
pkgver=18.1
pkgrel=1
arch=('any')
pkgdesc="Sophisticated object-relational DBMS (Android ${_android_arch})"
url='https://www.postgresql.org/'
license=('custom:PostgreSQL')
groups=('android-postgresql')
depends=("android-${_android_arch}-icu"
         "android-${_android_arch}-libxml2"
         "android-${_android_arch}-lz4"
         "android-${_android_arch}-openssl"
         "android-${_android_arch}-zlib"
         "android-${_android_arch}-zstd")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2"
        '0001-Fix-pthread_barrier.patch'
        '0002-Disable-nl_langinfo_l.patch')
md5sums=('32f047dc587bbc90a4f68ea7b903485d'
         '903e0cd9a270d3c0ef5123e9a77e13bb'
         '907830da0b8cd05672b7ca6422798734')

prepare() {
    cd "${srcdir}/postgresql-${pkgver}"
    source android-env ${_android_arch}

    patch -p1 -i ../0001-Fix-pthread_barrier.patch

    if [ "${ANDROID_MINIMUM_PLATFORM}" -lt 23 ]; then
        patch -p1 -i ../0002-Disable-nl_langinfo_l.patch
    fi
}

build() {
    cd "${srcdir}/postgresql-${pkgver}"
    source android-env ${_android_arch}

    export CFLAGS="${CFLAGS} -I${PWD}/src/backend"
    export CXXFLAGS="${CXXFLAGS} -I${PWD}/src/backend"

    android-${_android_arch}-configure \
        --sysconfdir="${ANDROID_PREFIX_ETC}" \
        --enable-nls \
        --disable-rpath \
        --disable-nls \
        --with-libxml \
        --with-openssl \
        --with-icu \
        --with-lz4 \
        --with-zstd \
        --without-readline
    make -C src/interfaces/libpq-oauth
}

package() {
    cd "${srcdir}/postgresql-${pkgver}"
    source android-env ${_android_arch}

    make -C src/interfaces/libpq DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
    rm -f "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so.*

    install -vDm 644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
