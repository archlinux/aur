# Maintainer: Masato TOYOSHIMA <phoepsilonix@gmail.com>

_pkgname=libressl
pkgbase=libressl-3.7
pkgname=libressl-3.7
pkgver=3.7.3
pkgrel=1
pkgdesc="Free version of the TLS/crypto stack forked from OpenSSL"
arch=(x86_64)
url="https://www.libressl.org/"
license=(ISC custom:OpenSSL)
depends=(glibc)
optdepends=(ca-certificates)
makedepends=(patchelf)
conflicts=(libressl)
provides=(libressl)
backup=(etc/libressl/openssl.cnf)
source=(https://cdn.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${pkgver}.tar.gz{,.asc}
        libtls.patch)
sha256sums=('7948c856a90c825bd7268b6f85674a8dcd254bae42e221781b24e3f8dc335db3'
            'SKIP'
            '294c7dd77b5a63593264f89184226256a2988661b4748722e510e2deda42810b')
validpgpkeys=(
A1EB079B8D3EB92B4EBD3139663AF51BD5E4D8D5
)

prepare() {
    cd ${_pkgname}-${pkgver}
    autoreconf -vfi
    patch -p1 -i ../libtls.patch
    unset LD_LIBRARY_PATH

    CPPFLAGS="$CPPFLAGS" \
    CFLAGS="$CFLAGS" \
    CXXFLAGS="$CXXFLAGS" \
    LDFLAGS="$LDFLAGS" \
    ./configure \
        --prefix=/usr \
        --with-openssldir=/etc/libressl \
        --libdir=/usr/lib/${pkgname} \
        --includedir=/usr/include/${pkgname} \
        --program-prefix "libressl-" \
        --enable-shared \
        --enable-static \
        --enable-nc \
    
#    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
}

build() {
    cd ${_pkgname}-${pkgver}
    make
}

check() {
    cd ${_pkgname}-${pkgver}
    make check
}

package() {
    cd ${_pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
    patchelf --remove-rpath "${pkgdir}"/usr/lib/${pkgname}/libssl.so
    patchelf --remove-rpath "${pkgdir}"/usr/bin/libressl-ocspcheck
    patchelf --remove-rpath "${pkgdir}"/usr/bin/libressl-openssl
    install -Dm644 COPYING -t "${pkgdir}"/usr/share/licenses/${pkgname}/
    mkdir -p "${pkgdir}"/etc/ld.so.conf.d/
    echo "/usr/lib/${pkgname}" | tee -a "${pkgdir}"/etc/ld.so.conf.d/libressl.conf

    # Remove symlink man pages that point to OpenSSL ones since the prefix is not accounted for
    for manlink in $(find -L "${pkgdir}"/usr/share/man/man3/ -type l) ;
    do
        rm "${manlink}" ;
    done
}
# vim: ts=4 sw=4 et:
