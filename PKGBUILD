# Based  on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: Kevin Liu <we123445@outlook.com>


_pkgname=qqmusic

pkgname="${_pkgname}"-appimage
pkgver=1.1.1
pkgrel=2
pkgdesc="A music player from Tencent"
arch=('x86_64')
url="https://y.qq.com"
license=('custom')
depends=()
options=(!strip)
_appimage="QQmusic-${pkgver}.AppImage"
source=("http://dldir1.qq.com/music/clntupate/linux/AppImage/${_appimage}")
sha512sums=("20b5227c77297490e886dd3081eb476063e4961d683b3f84e9072c1e90c88774830b41acce1c7b07d639feda1e7e1a5e26ab04142f89db398afe9ea595435d5e")

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
