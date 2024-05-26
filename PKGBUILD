# Maintainer: Tai Lam <taivlam-aur-mpr [dot] tinsmith796 [at] silomails [dot] com>
# Contributor: Kyle Phillips <kyle@pkyle.me>
# Based  on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html

_pkgname=mudita-center

pkgname="${_pkgname}"-appimage
pkgver=2.3.0
pkgrel=1
pkgdesc="Mudita Center Electron App. Expand and update the features of Mudita Pure, while using your computer."
arch=('x86_64')
url="https://github.com/mudita/mudita-center"
license=('GPL-3.0-or-later')
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/mudita/mudita-center/releases/download/${pkgver}/Mudita-Center.AppImage")
noextract=("${_appimage}")
b2sums_x86_64=('dcf25dbf3b2ae7916354dba9586b8f3314c8a29b13092f392409be419c7af96d169f5d23f4dc965f961bbc161e47b48a5686848dac898a8622586d5f44d9e295')
prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/Mudita Center.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/Mudita Center.desktop"\
            "${pkgdir}/usr/share/applications/Mudita Center.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
