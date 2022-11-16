# Maintainer: mmoya <mmoya at mmoya dot org>

_pkgname=nym-wallet
pkgname="${_pkgname}-appimage"
pkgver=1.1.0
pkgrel=1
pkgdesc="The Nym desktop wallet enables you to use the Nym network and take advantage of its key capabilities"
arch=('x86_64')
url="https://github.com/nymtech/nym/tree/develop/nym-wallet"
license=('Apache 2.0')
depends=('webkit2gtk')
options=(!strip)
_filename="${_pkgname}_${pkgver}_amd64.AppImage"
source_x86_64=("https://github.com/nymtech/nym/releases/download/nym-wallet-v${pkgver}/${_filename}")
sha256sums_x86_64=(4e4a3ddc382a4964686a18a4334bbf7a2863913d872c9ed95c9a882b06d9fa90)

package() {
    chmod +x ${_filename}
    ./${_filename} --appimage-extract "nym-wallet.desktop" >/dev/null 2>&1
    ./${_filename} --appimage-extract "usr/bin/nym-wallet" >/dev/null 2>&1
    ./${_filename} --appimage-extract "usr/share/icons/hicolor/*/apps/nym-wallet.png" >/dev/null 2>&1

    install -Dm644 "squashfs-root/nym-wallet.desktop" "${pkgdir}/usr/share/applications/nym-wallet.desktop"

    install -Dm755 "squashfs-root/usr/bin/nym-wallet" "${pkgdir}/usr/bin/nym-wallet"
    chmod 755 "${pkgdir}/usr/bin"

    install -dm755 "${pkgdir}/usr/share/icons"
    cp -dpr --no-preserve=ownership "squashfs-root/usr/share/icons" "${pkgdir}/usr/share"
    find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 {} \;
    find "${pkgdir}/usr/share/icons" -type f -name "nym-wallet.png" -exec chmod 644 {} \;
}
