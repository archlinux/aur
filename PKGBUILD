# Maintainer: Tai Lam <47955724+taivlam at users.noreply.github dot com>
# Contributor: Kyle Phillips <kyle@pkyle.me>
# Based  on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html

_pkgname=mudita-center

pkgname="${_pkgname}"-appimage
pkgver=2.2.7
pkgrel=1
pkgdesc="Mudita Center Electron App. Expand and update the features of Mudita Pure, while using your computer."
arch=('x86_64')
url="https://github.com/mudita/mudita-center"
license=('GPL3')
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/mudita/mudita-center/releases/download/${pkgver}/Mudita-Center.AppImage")
noextract=("${_appimage}")
sha256sums_x86_64=('e15eca1dc81adc1d950e445f22c57428e3882f562a8c337034e0a22ab3ccb502')
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
