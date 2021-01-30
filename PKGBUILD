# Maintainer: qvshuo <qvshuo@foxmail.com>

_pkgname=yesplaymusic
pkgname=yesplaymusic-appimage
pkgver=0.3.2
pkgrel=1
pkgdesc="高颜值的第三方网易云播放器，支持 Windows / macOS / Linux。"
arch=('x86_64')
url="https://github.com/qier222/YesPlayMusic"
license=('MIT')
depends=( 'fuse')
options=(!strip)
_appimage="YesPlayMusic-${pkgver}.AppImage"
source=(
    ${url}/releases/download/v${pkgver}/YesPlayMusic-${pkgver}.AppImage
)
noextract=("${_appimage}")
sha512sums=(
    kWQlx1mEHZspgTkUCrHfZzYGvldwjfNH/Aquu/v/j3B5+1pKFriL0fmEjcBup8cN8qUoouvvOABbm9qGLkq1Xw==
)

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname} %u|"\
        "squashfs-root/${_pkgname}.desktop"
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}