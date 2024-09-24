# Maintainer: mmoya <mmoya at mmoya dot org>

_pkgname=nym-wallet
pkgname="${_pkgname}-appimage"
pkgver=1.2.14
pkgrel=1
pkgdesc="The Nym desktop wallet enables you to use the Nym network and take advantage of its key capabilities"
arch=('x86_64')
url="https://github.com/nymtech/nym"
license=('Apache 2.0')
depends=('openssl-1.1' 'webkit2gtk')
options=(!strip)
_filename="${_pkgname}_${pkgver}_amd64.AppImage"
source=("https://github.com/nymtech/nym/releases/download/nym-wallet-v${pkgver}/${_filename}")
sha256sums=('e42be32e2c6e65de9761653cac0f562d6cf08db115a2cf852106c9f80869c233')

package() {
    chmod +x ${_filename}
    ./${_filename} --appimage-extract "usr/bin/nym-wallet" >/dev/null 2>&1
    ./${_filename} --appimage-extract "usr/share/applications/nym-wallet.desktop" >/dev/null 2>&1
    ./${_filename} --appimage-extract "usr/share/icons/hicolor/*/apps/nym-wallet.png" >/dev/null 2>&1

    install -Dm644 "squashfs-root/usr/share/applications/nym-wallet.desktop" "${pkgdir}/usr/share/applications/nym-wallet.desktop"

    install -Dm755 "squashfs-root/usr/bin/nym-wallet" "${pkgdir}/usr/bin/nym-wallet"
    chmod 755 "${pkgdir}/usr/bin"

    install -dm755 "${pkgdir}/usr/share/icons"
    cp -dpr --no-preserve=ownership "squashfs-root/usr/share/icons" "${pkgdir}/usr/share"
    find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 {} \;
    find "${pkgdir}/usr/share/icons" -type f -name "nym-wallet.png" -exec chmod 644 {} \;
}
