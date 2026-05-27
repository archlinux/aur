# Maintainer: Jasper Nuyens <jnuyens at linuxbe dot com>
# SPDX-License-Identifier: 0BSD
#
# This PKGBUILD (the packaging recipe) is licensed under 0BSD; see the
# LICENSE file alongside it. The modulejail package it builds is licensed
# under GPL-3.0-only by its upstream author (declared in license= below).
pkgname=modulejail
pkgver=1.3.1
pkgrel=1
pkgdesc='Proactively shrink Linux kernel-module attack surface by blacklisting unused modules'
arch=('any')
url='https://github.com/jnuyens/modulejail'
license=('GPL-3.0-only')
depends=()
optdepends=('kmod: provides modprobe, which consumes the generated blacklist file at runtime'
            'util-linux: logger(1) for syslog integration')
makedepends=('sequoia-sqv')
# Source filenames deliberately avoid the .sig/.sign/.asc extensions so
# makepkg's built-in gpg verifier does NOT auto-trigger; the sole verifier
# is sequoia-sqv invoked from prepare() (per AUR comment from Velocifyer
# 2026-05-24: use sqv, not gpg). The signing key is shipped in this AUR
# repo as modulejail-signing-key.gpg (sha256 below) so verification needs
# no keyring state, no network beyond the source fetch, and no gpg.
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tarball-signature::${url}/releases/download/v${pkgver}/v${pkgver}.tar.gz.sig"
        'modulejail-signing-key.gpg')
sha256sums=('ea6c3df2fcdef4905a77fd86f316ca04f7ccfb2ffd7f0c9b995e1af043afd64a'
            'SKIP'
            '5b4f8bef3957b8d8f91475aeb40f398dc87b550b7bdc8458b72661112b033433')

prepare() {
    sqv --keyring "${srcdir}/modulejail-signing-key.gpg" \
        --signature-file "${srcdir}/${pkgname}-${pkgver}.tarball-signature" \
        "${srcdir}/${pkgname}-${pkgver}.tar.gz"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 modulejail "$pkgdir/usr/bin/modulejail"

    install -d "$pkgdir/usr/share/man/man8"
    BUILD_DATE=$(date -u ${SOURCE_DATE_EPOCH:+-d "@$SOURCE_DATE_EPOCH"} '+%Y-%m-%d')
    sed -e "s/__VERSION__/$pkgver/g" -e "s/__DATE__/$BUILD_DATE/g" man/modulejail.8.in \
        > "$pkgdir/usr/share/man/man8/modulejail.8"

    install -Dm644 README.md    "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
