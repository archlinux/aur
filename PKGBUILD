# Maintainer: Keiran <keircn@proton.me>

pkgname=seanime-denshi
_pkgname=seanime-denshi
pkgver=3.8.3
pkgrel=1
pkgdesc="A self-hosted server that seamlessly integrates with your local anime collection with anilist integration. (Denshi AppImage variant)"
arch=(x86_64)
url="https://github.com/5rahim/seanime"
license=('MIT')

depends=('fuse2')
conflicts=('seanime' 'seanime-bin')

options=('!strip')

source=(
    "https://github.com/5rahim/seanime/releases/download/v${pkgver}/${_pkgname}-${pkgver}_Linux_x86_64.AppImage"
)

sha256sums=('65f4a2bb03e278b612c36082db927150961211e04cebb0b6b375dfc3d9e58975')

package() {
    local appimage="${_pkgname}-${pkgver}_Linux_x86_64.AppImage"

    install -d "${pkgdir}/opt/${pkgname}"
    install -Dm755 "${srcdir}/${appimage}" \
        "${pkgdir}/opt/${pkgname}/${appimage}"

    cd "${srcdir}"
    chmod +x "${appimage}"
    "./${appimage}" --appimage-extract >/dev/null

    install -d "${pkgdir}/usr/bin"
    ln -sf "/opt/${pkgname}/${appimage}" \
        "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 /dev/stdin \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Name=Seanime Denshi
Exec=/usr/bin/${pkgname}
Icon=${pkgname}
Type=Application
Categories=Network;Video;
Terminal=false
EOF

    install -Dm644 \
        "${srcdir}/squashfs-root/usr/share/icons/hicolor/439x439/apps/seanime-denshi.png" \
        "${pkgdir}/usr/share/icons/hicolor/439x439/apps/${pkgname}.png"
}
