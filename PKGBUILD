# Based  on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: Kevin Liu <we123445@outlook.com>


_pkgname=qqmusic

pkgname="${_pkgname}"-appimage
pkgver=1.1.0
pkgrel=2
pkgdesc="A music player from Tencent"
arch=('x86_64')
url="https://y.qq.com"
license=('custom')
depends=()
options=(!strip)
_appimage="QQmusic-${pkgver}.AppImage"
source=("http://dldir1.qq.com/music/clntupate/linux/AppImage/${_appimage}")
sha512sums=("bd0e44785eb71c3ef2798a1543263099379ecab4e925c4be2a78e4de8241759ebb7874eb859e5b0f6c5b664074d0efe37aa56b36cd6313e6b7247e09bb88f139")

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname} %u|"\
        "squashfs-root/${_pkgname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
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
