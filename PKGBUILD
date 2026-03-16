# Maintainer: misaka10987 <misaka10987@outlook.com>

_pkgname=splayer
_Pkgname=SPlayer

pkgname=splayer-appimage
_upstream_pkgver=3.0.0
pkgver=3.0.0
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
    "${_Pkgname}.AppImage::https://github.com/imsyy/SPlayer/releases/download/v$_upstream_pkgver/splayer-$_upstream_pkgver-x86_64.AppImage"
)
sha256sums=(
    "8bd7a3a2e64457e558a73f6b117fb9b0e928d95577cad181734101e68c62a886"
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
