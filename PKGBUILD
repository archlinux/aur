# Maintainer: Levente Polyak <anthraxx@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Maarten de Vries <maarten@de-vri.es>
# Contributor: Reventlov <contact@volcanis.me>
# Contributor: kpcyrd <git@rxv.cc>

_pkgname=libressl
pkgname=libressl-3.7
pkgver=3.7.3
pkgrel=2
pkgdesc="Free version of the TLS/crypto stack forked from OpenSSL"
arch=(x86_64)
url="https://www.libressl.org/"
license=(ISC custom:OpenSSL)
depends=(glibc)
optdepends=(ca-certificates)
backup=(etc/libressl/openssl.cnf)
source=(https://cdn.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${pkgver}.tar.gz{,.asc})
sha256sums=('7948c856a90c825bd7268b6f85674a8dcd254bae42e221781b24e3f8dc335db3'
            'SKIP')
provides=(libressl=${pkgver})
conflicts=(libressl)
replaces=(libressl)
validpgpkeys=(A1EB079B8D3EB92B4EBD3139663AF51BD5E4D8D5) # Brent Cook <bcook@openbsd.org>

prepare() {
    cd ${_pkgname}-${pkgver}
    autoreconf -vfi
}

build() {
    cd ${_pkgname}-${pkgver}
    ./configure \
        --prefix=/usr \
        --with-openssldir=/etc/libressl \
        --libdir=/usr/lib/libressl \
        --includedir=/usr/include/libressl \
        --program-prefix "libressl-"
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make
}

check() {
    cd ${_pkgname}-${pkgver}
    make check
}

package() {
    cd ${_pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
    install -Dm644 COPYING -t "${pkgdir}"/usr/share/licenses/${pkgname}/

    mkdir -p "${pkgdir}/etc/ld.so.conf.d"
    echo "/usr/lib/${_pkgname}" > "${pkgdir}/etc/ld.so.conf.d/${_pkgname}.conf"

    # Remove symlink man pages that point to OpenSSL ones since the prefix is not accounted for
    for manlink in $(find -L "${pkgdir}"/usr/share/man/man3/ -type l) ;
    do
        rm "${manlink}" ;
    done
}

# vim: ts=4 sw=4 et:
