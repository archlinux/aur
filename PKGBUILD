# Maintainer: Keiran <keircn@proton.me>

pkgname=seanime-denshi
_pkgname=seanime-denshi
pkgver=3.10.2
pkgrel=1
pkgdesc="A self-hosted server that seamlessly integrates with your local anime collection with anilist integration. (Denshi AppImage variant)"
arch=(x86_64)
url="https://github.com/5rahim/seanime"
license=('MIT')

depends=('fuse2' 'hicolor-icon-theme')
conflicts=('seanime' 'seanime-bin')
makedepends=('gtk-update-icon-cache')

options=('!strip')

source=(
    "https://github.com/5rahim/seanime/releases/download/v${pkgver}/${_pkgname}-${pkgver}_Linux_x86_64.AppImage"
)

sha256sums=('029a6dda0878998cb3d58318e2ebcd9a95c690a56ac438a600134a3214db64c0')

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

    local icon="${srcdir}/squashfs-root/usr/share/icons/hicolor/439x439/apps/seanime-denshi.png"
    for size in 256x256 512x512; do
        install -Dm644 "${icon}" \
            "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${pkgname}.png"
    done

    gtk-update-icon-cache -q "${pkgdir}/usr/share/icons/hicolor" || true
}
