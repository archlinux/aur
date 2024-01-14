# Maintainer: ArtFox3 <artfox3@gmail.com>

_pkgname=appium-inspector
_pkgver=$(curl https://api.github.com/repos/appium/appium-inspector/releases/latest | grep "AppImage" | grep name | cut -d'-' -f4 | cut -d'.' -f1-3)
_pkgsource=$(curl https://api.github.com/repos/appium/appium-inspector/releases/latest | grep "AppImage" | grep browser_download_url | cut -d'"' -f4)

pkgname="${_pkgname}"-appimage
pkgver="${_pkgver}"
pkgrel=1
pkgdesc="Description of my project"
arch=('x86_64')
url="https://github.com/appium/appium-inspector/"
license=('custom:Unlicense')
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"

# install script for post install changes
#install=$pkgname.install

source_x86_64=(
    "${_appimage}::${_pkgsource}"
    "https://raw.githubusercontent.com/appium/appium-inspector/v${pkgver}/LICENSE"
)

noextract=("${_appimage}")
sha256sums_x86_64=('bb2415b621de39b8a9979f330cb8dd2fe86c76fa96fc26d0bc06e198dd62a262'
                   'afc4a40f552d48dd41e24d6e247a15a0712b69fc740811cb36a99e9bd98dff61')

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
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
