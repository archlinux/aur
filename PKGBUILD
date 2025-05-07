# Maintainer: mmoya <mmoya at mmoya dot org>

_pkgname=nym-wallet
pkgname="${_pkgname}-appimage"
pkgver=1.2.18
pkgrel=1
pkgdesc="The Nym desktop wallet enables you to use the Nym network and take advantage of its key capabilities"
arch=('x86_64')
url="https://github.com/nymtech/nym"
license=('Apache 2.0')
depends=('webkit2gtk-4.1')
options=(!debug)
_filename="NymWallet_${pkgver}_amd64.AppImage"
source=("https://github.com/nymtech/nym/releases/download/nym-wallet-v${pkgver}/${_filename}")
sha256sums=('5825adcbe3ea72db800122be48e56b9927595ce78d0b098f7ac5efead4f2dd47')

package() {
    chmod +x ${_filename}
    ./${_filename} --appimage-extract "usr/bin/NymWallet" >/dev/null 2>&1
    ./${_filename} --appimage-extract "usr/share/applications/NymWallet.desktop" >/dev/null 2>&1
    ./${_filename} --appimage-extract "usr/share/icons/hicolor/*/apps/NymWallet.png" >/dev/null 2>&1

    install -Dm644 "squashfs-root/usr/share/applications/NymWallet.desktop" "${pkgdir}/usr/share/applications/NymWallet.desktop"

    install -Dm755 "squashfs-root/usr/bin/NymWallet" "${pkgdir}/usr/bin/NymWallet"
    chmod 755 "${pkgdir}/usr/bin"

    install -dm755 "${pkgdir}/usr/share/icons"
    cp -dpr --no-preserve=ownership "squashfs-root/usr/share/icons" "${pkgdir}/usr/share"
    find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 {} \;
    find "${pkgdir}/usr/share/icons" -type f -name "NymWallet.png" -exec chmod 644 {} \;
}
