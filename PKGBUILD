# Maintainer: logan_reed <liulingzhang.work@icloud.com>

_pkgname=navicat17-premium-cs
pkgname=navicat17-premium-zh-cn
pkgver=17.3.9
pkgrel=2
pkgdesc="Navicat Premium is a multi-connection database development tool. (Chinese Simplified)"
arch=('x86_64' 'aarch64')
url='https://www.navicat.com.cn/products/navicat-premium'
license=('LicenseRef-Navicat')
depends=('fontconfig' 'freetype2' 'hicolor-icon-theme')
conflicts=('navicat' 'navicat-premium' 'navicat17-premium')
provides=("navicat=$pkgver")
source=("navicat.sh")
source_x86_64=("${_pkgname}-x86_64-${pkgver}.AppImage::https://dn.navicat.com/download/navicat17-premium-cs-x86_64.AppImage")
source_aarch64=("${_pkgname}-aarch64-${pkgver}.AppImage::https://dn.navicat.com/download/navicat17-premium-cs-aarch64.AppImage")

sha512sums=('f219a434db6deea02be5c160de2956d62ee7a36a702272c638d9dd8aa8c9d7868432b47914146da0c6b9658c17d5bdc6b65af262235fbf09a1c0c0260b43334d')
sha512sums_x86_64=('496352100be4a039fad27679d81386210455e08a2d52eb7993ae5e4253df466a83c95feb24b537c4e6df7776733c227b5e77a08859a1e94a0ea48c099b6ad979')
sha512sums_aarch64=('a99802d431d95da36d8febcb499a5b01a44552b79834a8db8e7ee234ef3cbfebaa1e742a64b7d723818ea0de973e20962093a1d16210c4a87fd9b57f154827bc')

options=('!strip' '!debug')

prepare() {
    cd "${srcdir}/" && rm -rf "squashfs-root"
    chmod +x "${srcdir}/${_pkgname}-${CARCH}-${pkgver}.AppImage"
    "${srcdir}/${_pkgname}-${CARCH}-${pkgver}.AppImage" --appimage-extract
}

package() {
    install -d "${pkgdir}/opt/${_pkgname}"
    cp -a "${srcdir}/squashfs-root/." "${pkgdir}/opt/${_pkgname}/"

    # Desktop entry
    install -Dm644 "squashfs-root/navicat.desktop" \
        "${pkgdir}/usr/share/applications/navicat.desktop"
    sed -i 's|Icon=.*|Icon=navicat-icon|' "${pkgdir}/usr/share/applications/navicat.desktop"

    # Icon
    install -Dm644 "squashfs-root/navicat-icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/navicat-icon.png"

    # Launcher
    install -Dm755 "${srcdir}/navicat.sh" "${pkgdir}/usr/bin/navicat"

    # Remove Debian copyright files
    rm -rf "${pkgdir}/opt/${_pkgname}/usr/share/doc"
    rm -rf "${pkgdir}/opt/${_pkgname}/share/doc"
}
