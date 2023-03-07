# Maintainer: Masato TOYOSHIMA <phoepsilonix@gmail.com>
# Maintainer: Levente Polyak <anthraxx@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Maarten de Vries <maarten@de-vri.es>
# Contributor: Reventlov <contact@volcanis.me>
# Contributor: kpcyrd <git@rxv.cc>

pkgname=libressl
pkgver=3.7.0
pkgrel=2
pkgdesc="Free version of the TLS/crypto stack forked from OpenSSL"
arch=(x86_64)
url="https://www.libressl.org/"
license=(ISC custom:OpenSSL)
depends=(glibc)
optdepends=(ca-certificates)
backup=(etc/libressl/openssl.cnf)
source=(https://cdn.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${pkgver}.tar.gz{,.asc}
        libtls.patch)
sha256sums=('3fc1290f4007ec75f6e9acecbb25512630d1b9ab8c53ba79844e395868c3e006'
            'SKIP'
            '294c7dd77b5a63593264f89184226256a2988661b4748722e510e2deda42810b')
validpgpkeys=(A1EB079B8D3EB92B4EBD3139663AF51BD5E4D8D5) # Brent Cook <bcook@openbsd.org>

prepare() {
    cd ${pkgname}-${pkgver}
    autoreconf -vfi
    patch -p1 -i ../libtls.patch

    CFLAGS="$CFLAGS" \
    CXXFLAGS="$CXXFLAGS" \
    LDFLAGS="$LDFLAGS" \
    ./configure \
        --prefix=/usr \
        --with-openssldir=/etc/libressl \
        --libdir=/usr/lib/libressl \
        --includedir=/usr/include/libressl \
        --program-prefix "libressl-" \
        --enable-shared \
        --enable-static \
        --enable-nc \
    
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
}

build() {
    cd ${pkgname}-${pkgver}
    make
}

check() {
    cd ${pkgname}-${pkgver}
    make check
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
    patchelf --remove-rpath "${pkgdir}"/usr/lib/libressl/libssl.so
    patchelf --remove-rpath "${pkgdir}"/usr/bin/libressl-ocspcheck
    patchelf --remove-rpath "${pkgdir}"/usr/bin/libressl-openssl
    install -Dm644 COPYING -t "${pkgdir}"/usr/share/licenses/${pkgname}/
    mkdir -p "${pkgdir}"/etc/ld.so.conf.d/
    echo "/usr/lib/libressl/" | tee -a "${pkgdir}"/etc/ld.so.conf.d/libressl.conf

    # Remove symlink man pages that point to OpenSSL ones since the prefix is not accounted for
    for manlink in $(find -L "${pkgdir}"/usr/share/man/man3/ -type l) ;
    do
        rm "${manlink}" ;
    done
}
# vim: ts=4 sw=4 et:
