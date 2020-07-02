# Maintainer: David Parrish <daveparrish@tutanota.com>

_pkgname=whirlpool-gui

pkgname="${_pkgname}"-appimage
pkgver=0.10.2
pkgrel=1
pkgdesc="Desktop GUI for Whirlpool by Samourai-Wallet"
arch=('x86_64')
url="https://github.com/Samourai-Wallet/whirlpool-gui/"
license=('custom:Unlicense')
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://code.samourai.io/whirlpool/whirlpool-gui/uploads/f48f95d2022733a8b10cd0a57cc36cb3/whirlpool-gui-${pkgver}.AppImage"
               "https://code.samourai.io/whirlpool/whirlpool-gui/-/raw/${pkgver}/LICENSE"
              )
noextract=("${_appimage}")
sha256sums_x86_64=('de3f529563cc52ae24cc768d77e9bd6693bf9620583d6d30f5c4f2a82e12b3b0'
                   '60d2c28d19d2bdf7bbaa59829e7a595234265e8111a01ccb74d25d6c4d2d013a')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/${_pkgname}.desktop"

    # Fix icon image location
    mkdir -p squashfs-root/usr/share/icons/hicolor/512x512/apps
    cp squashfs-root/usr/share/icons/hicolor/0x0/apps/"${_pkgname}".png\
       squashfs-root/usr/share/icons/hicolor/512x512/apps

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
