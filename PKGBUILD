# Maintainer: misaka10987 <misaka10987@outlook.com>

_pkgname=splayer
_Pkgname=SPlayer

pkgname=splayer-appimage
pkgver=3.0.0_beta.8.2025
pkgrel=1
pkgdesc="🎉 一个简约的音乐播放器，支持逐字歌词，下载歌曲，展示评论区，音乐云盘及歌单管理，音乐频谱，移动端基础适配 | 网易云音乐 | A minimalist music player"
arch=('x86_64')
url="https://github.com/imsyy/SPlayer"
license=("AGPL-3.0-only")
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=(!strip !debug)
depends=('fuse2')
source=(
#     "${_Pkgname}.AppImage::${url}/releases/download/v${pkgver//_/-}/splayer-${pkgver//_/-}-x86_64.AppImage"
    "${_Pkgname}.AppImage::https://github.com/imsyy/SPlayer/releases/download/v3.0.0-beta.8.2025/splayer-3.0.0-beta.8-x86_64.AppImage"
)
sha256sums=(
    "89ea2384ac9856103c76fcb88b5e6219fcdd9f6500387bbf54abd8db50babc1d"
)

_appimage="${_Pkgname}.AppImage"
noextract=("${_appimage}")

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    sed -i -e "s|Icon=.*|Icon=${_pkgname}|" "squashfs-root/${_Pkgname}.desktop"
    # Change Exec
    sed -i -e "s|Exec=.*|Exec=splayer --no-sandbox %U|" "squashfs-root/${_Pkgname}.desktop"
    sed -i -e "s|Categories=.*|Categories=AudioVideo;Audio;Player;|" "squashfs-root/${_Pkgname}.desktop"

    chmod -R a-x+rX squashfs-root/usr
}

package() {

    install -Dm755 "${_appimage}" "${pkgdir}/opt/${_pkgname}/${_appimage}"

    install -Dm644 "${srcdir}/squashfs-root/${_Pkgname}.desktop" "${pkgdir}/usr/share/applications/${_Pkgname}.desktop"

    install -dm755 "${pkgdir}/usr/share"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share"
    ln -s "${_Pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}"
}
