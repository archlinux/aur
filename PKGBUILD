# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Giovanni Harting <539@idlegandalf.com>
# Contributor: kreon <kreon@jnode.in>
# Contributor: Boohbah <boohbah at gmail.com>
# Contributor: Daniel J Griffiths <ghost1227 at archlinux.us>
# Contributor: Mantas Mikulėnas <grawity at gmail.com>

pkgname=eggdrop
pkgver=1.10.2
pkgrel=1
pkgdesc="World's most popular Internet Relay Chat (IRC) bot"
arch=('x86_64')
url="https://www.eggheads.org"
license=('GPL-2.0-or-later')
depends=('bash' 'glibc' 'openssl' 'python' 'tcl' 'zlib')
source=("https://github.com/eggheads/eggdrop/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.asc})
b2sums=('fc75ce6727927a1809358a67d2930893bf01aa021b2e85c4fce5f3c05a7dcb51b209d99393cfb7864d4acf7ee89240374427475e4caf32b5eb06b07b790eb426'
        'SKIP')
validpgpkeys=('E01C240484DE7DBE190FE141E7667DE1D1A39AFF')

prepare() {
    cd "${pkgname}-${pkgver}"

    # don't complain about language files on startup
    sed -i "s|\"./language\"|\"/usr/share/${pkgname}/language\"|g" src/eggdrop.h
}

build() {
    cd "${pkgname}-${pkgver}"
    ./configure
    make config
    make
    make DEST=build install
}

package() {
    cd "${pkgname}-${pkgver}/build"
    install -d "${pkgdir}/usr/lib" "${pkgdir}/usr/share/doc" "${pkgdir}/usr/share/${pkgname}"
    install -Dm755 "eggdrop-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
    cp -r modules "${pkgdir}/usr/lib/${pkgname}"

    install -Dm644 "doc/man1/${pkgname}.1" -t "${pkgdir}/usr/share/man/man1"
    rm -r doc/man1
    cp -r doc "${pkgdir}/usr/share/doc/${pkgname}"

    for dir in help language scripts text; do
        cp -r "${dir}" "${pkgdir}/usr/share/${pkgname}"
    done

    for conf in eggdrop.conf eggdrop-basic.conf; do
        sed -e '2,3d' \
            -e "1s|^.*|#!/usr/bin/${pkgname}\n|" \
            -e "s|help/|/usr/share/${pkgname}/help/|g" \
            -e "s|scripts/|/usr/share/${pkgname}/scripts/|g" \
            -e "s|text/|/usr/share/${pkgname}/text/|g" \
            -e "s|modules/|/usr/lib/${pkgname}/|g" \
            "${conf}" >"${pkgdir}/usr/share/doc/${pkgname}/${conf}"
    done
}
