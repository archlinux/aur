# Maintainer: Keiran <keircn@proton.me>

pkgname=seanime-denshi
_pkgname=seanime-denshi
pkgver=3.9.1
pkgrel=0
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

sha256sums=('e90ad189ff7b11e081126244969445c106ed9717f083cb6d5bb241dcbed2c51e')

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
