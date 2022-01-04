# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: Paul Sauve <paul@technove.co>

_pkgname=actual
_Pkgname=Actual

pkgname="${_pkgname}"-appimage
pkgver=0.0.145
pkgrel=1
pkgdesc="Actual is a super fast privacy-focused app for managing your finances."
arch=('x86_64')
url="https://actualbudget.com/"
license=('custom:Commercial')
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
_appimage="${_Pkgname}-${pkgver}-x86_64.AppImage"
source_x86_64=("${_appimage}::https://github.com/actualbudget/releases/releases/download/${pkgver}/${_Pkgname}-${pkgver}-x86_64.AppImage")
noextract=("${_appimage}")
sha256sums_x86_64=('74d0aaaa49b4c393dfff419d8485cc16c2694d03ba3117d5a6a36a72d15da065')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
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
