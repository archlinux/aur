# Maintainer: MuyeSlock <MuyeSlock at 163 dot com>

_pkgname=splayer
_Pkgname=SPlayer

pkgname=splayer-appimage
pkgver=3.0.0_beta.1
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
    "${_Pkgname}.AppImage::${url}/releases/download/v${pkgver//_/-}/splayer-${pkgver//_/-}.AppImage"
)
sha256sums=(
    "811008909dbdcc1a336e783e2490cb7b3c297bf755f863f1241378f161da2e31"	
)

_appimage="${_Pkgname}.AppImage"
noextract=("${_appimage}")

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    sed -i -e "s|Icon=.*|Icon=/usr/share/icons/${_pkgname}.png|" "squashfs-root/${_pkgname}.desktop"
    # Change Exec
    sed -i -e "s|Exec=.*|Exec=splayer --no-sandbox %U|" "squashfs-root/${_pkgname}.desktop"

    chmod -R a-x+rX squashfs-root/usr
}

package() {

    install -Dm755 "${_appimage}" "${pkgdir}/opt/${_pkgname}/${_appimage}"

    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    install -dm755 "${pkgdir}/usr/share"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share"
    ln -s "$(realpath ${srcdir}/squashfs-root/${_pkgname}.png --relative-to ${srcdir}/squashfs-root/usr/share/icons)" "${pkgdir}/usr/share/icons/${_pkgname}.png"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}"
}
