# Maintainer: Masato TOYOSHIMA <phoepsilonix@phoepsilonix.love>
# Maintainer: Levente Polyak <anthraxx@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Maarten de Vries <maarten@de-vri.es>
# Contributor: Reventlov <contact@volcanis.me>
# Contributor: kpcyrd <git@rxv.cc>

_pkgname=libressl
pkgname=libressl-3.8
pkgver=3.8.2
pkgrel=2
pkgdesc="Free version of the TLS/crypto stack forked from OpenSSL"
arch=(x86_64)
url="https://www.libressl.org/"
license=(ISC custom:OpenSSL)
depends=(glibc)
optdepends=(ca-certificates)
backup=(etc/libressl/openssl.cnf)
source=(https://cdn.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${pkgver}.tar.gz{,.asc})
sha256sums=('6d4b8d5bbb25a1f8336639e56ec5088052d43a95256697a85c4ce91323c25954'
            'SKIP')
provides=(libressl=${pkgver})
#conflicts=(libressl)
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
        --with-openssldir=/etc/libressl-3.8 \
        --libdir=/usr/lib/libressl-3.8 \
        --includedir=/usr/include/libressl-3.8 \
        --program-prefix "libressl-3.8-"
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
    echo "/usr/lib/${pkgname}" > "${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf"

    # Remove symlink man pages that point to OpenSSL ones since the prefix is not accounted for
    for manlink in $(find -L "${pkgdir}"/usr/share/man/man3/ -type l) ;
    do
        rm "${manlink}" ;
    done
}

# vim: ts=4 sw=4 et:
