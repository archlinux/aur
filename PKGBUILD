# Maintainer: Dedicatus5457 <moe at shinka dot top>
# Contributor: MuyeSlock <MuyeSlock at 163 dot com>

_pkgname=splayer
_Pkgname=SPlayer

pkgname=splayer-appimage-git
pkgver=3.0.0.beta.1.r17.gbfcd59d
pkgrel=3
pkgdesc="🎉 一个简约的音乐播放器，支持逐字歌词，下载歌曲，展示评论区，音乐云盘及歌单管理，音乐频谱，移动端基础适配 | 网易云音乐 | A minimalist music player"
arch=('x86_64')
url="https://github.com/Dedicatus5457/SPlayer"
license=("AGPL-3.0-only")
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "splayer-appimage" "splayer-bin")
options=(!strip !debug)
depends=('fuse2')
source=(
    "${_Pkgname}.AppImage::${url}/releases/download/v3.0.0-beta.1/splayer-3.0.0-beta.2.AppImage"
    # https://github.com/Dedicatus5457/SPlayer/releases/download/v3.0.0-beta.1/splayer-3.0.0-beta.2.AppImage
)
sha256sums=(
    "2a8bc34f13b863309186c2e684920b03e48920991ed93f09dadf8f7b11637729"
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
