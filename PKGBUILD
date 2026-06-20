# Maintainer: Jasper Nuyens <jnuyens at linuxbe dot com>
# SPDX-License-Identifier: 0BSD
#
# This PKGBUILD (the packaging recipe) is licensed under 0BSD; see the
# LICENSE file alongside it. The modulejail package it builds is licensed
# under GPL-3.0-only by its upstream author (declared in license= below).
pkgname=modulejail
pkgver=1.4.2
pkgrel=1
pkgdesc='Proactively shrink Linux kernel-module attack surface by blacklisting unused modules'
arch=('any')
url='https://modulejail.com'
license=('GPL-3.0-only')
depends=()
optdepends=('kmod: provides modprobe, which consumes the generated blacklist file at runtime'
            'util-linux: logger(1) for syslog integration'
            'mkinitcpio: enables the initramfs strip hook that --install-initramfs-hook drops'
            'curl: required by --self-update (wget also works)')
makedepends=('sequoia-sqv')
# Pacman .install file: post_install / post_upgrade run
#   `modulejail --install-initramfs-hook --yes` so the mkinitcpio strip
# hook and pacman trigger get deployed on every install. pre_remove
# removes them before the binary itself goes. Content lives at
# packaging/aur/modulejail.install in the upstream repo and is shipped
# into the AUR repo alongside this PKGBUILD by scripts/publish-aur.sh.
install=$pkgname.install
# Source filenames deliberately avoid the .sig/.sign/.asc extensions so
# makepkg's built-in gpg verifier does NOT auto-trigger; the sole verifier
# is sequoia-sqv invoked from prepare() (per AUR comment from Velocifyer
# 2026-05-24: use sqv, not gpg). The signing key is shipped in this AUR
# repo as modulejail-signing-key.gpg (sha256 below) so verification needs
# no keyring state, no network beyond the source fetch, and no gpg.
#
# url= above is the project homepage (modulejail.com) and is used by
# pacman -Si as the Homepage field; it does NOT host tarballs. The
# source array hard-codes the GitHub URL where releases actually live -
# do NOT substitute ${url} here, that was the v1.4.1-1 regression that
# 404'd on every install (gh #21, AUR comment 2026-06-09).
_source_host='https://github.com/jnuyens/modulejail'
source=("${pkgname}-${pkgver}.tar.gz::${_source_host}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tarball-signature::${_source_host}/releases/download/v${pkgver}/v${pkgver}.tar.gz.sig"
        'modulejail-signing-key.gpg')
sha256sums=('e23f85aa9337419b1dc7c8fab475a69862b8f8f3efaca211399a2b6674ed991d'
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
