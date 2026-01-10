# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: SirRoscoe <aur.jaunt684@passmail.net>

_pkgname="dlss-updater"
_Pkgname="DLSS_Updater_Linux"
_disname="io.github.recol.dlss-updater"
pkgname="${_pkgname}-appimage"
pkgver=3.5.0
pkgrel=2
pkgdesc="Update DLSS/XeSS/FSR DLLs for games"
arch=('x86_64')
url="https://github.com/Recol/DLSS-Updater"
license=('AGPL-3.0-only')
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
_appimage="${_pkgname}-${pkgver}-${arch}.AppImage"
source_x86_64=("${_appimage}::https://github.com/Recol/DLSS-Updater/releases/download/V${pkgver}/${_Pkgname}-${pkgver}-${arch}.AppImage"
			   "https://raw.githubusercontent.com/Recol/DLSS-Updater/refs/heads/main/LICENSE")
noextract=("${_appimage}")
sha256sums_x86_64=('d46b83578eacd0af63d4059792a452ea773ece0bf40fd603ffff6178b7f5ee66'
				   '543fa96aec228a26be5e2db380abda94a4481522498ea442430e9a2292b64fd5')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i \
    	-e "s|Exec=.*|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" \
    	-e "s|Icon=.*|Icon=/usr/share/icons/${_pkgname}.png|" \
        "squashfs-root/${_disname}.desktop"
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_disname}.desktop" \
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
	install -Dm644 "squashfs-root/${_disname}.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"
	
    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
