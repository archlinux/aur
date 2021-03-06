# Maintainer: Kwrazi Cosmos <kwrazi_AT_gmail_com>
# Based on Dave Parrish's PKGBUILD template for AppImage

_pkgname=guarda

pkgname="${_pkgname}"-appimage
pkgver=1.0.12
pkgrel=1
pkgdesc="a secure, easy-to-use open source multi-platform cryptocurrency wallet"
arch=('x86_64')
url="https://guarda.com/"
license=('GPLv3')
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
_appimage="${_pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://guarda.com/apps/Guarda-${pkgver}.AppImage"
               "https://raw.githubusercontent.com/guardaco/guarda-android-wallets/master/LICENSE")
noextract=("${_appimage}")
sha256sums_x86_64=('fe8da8d1316a63b469c92ab588fe9e6324173247ff9772e67d9a5ba3ac9edc55'
                   '8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b')

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
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" \
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