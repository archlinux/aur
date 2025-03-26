# Maintainer: Revincx <revincx233@gmail.com>

pkgname=5ire-extracted
pkgver=0.9.8
pkgrel=2
pkgdesc="5ire - cross-platform desktop AI assistant (extracted from Appimage)"
arch=('x86_64')
url="https://github.com/nanbingxyz/5ire"
license=('custom:Modified-Apache-License-2.0')

source=(
    "5ire-${pkgver}-x86_64.AppImage::https://github.com/nanbingxyz/5ire/releases/download/v${pkgver}/5ire-${pkgver}-x86_64.AppImage"
    "LICENSE::https://raw.githubusercontent.com/nanbingxyz/5ire/refs/heads/main/LICENSE"
)
sha256sums=(
    "67538593d1e34f4bf01c0b631144079ec5a3df2a26ff7c9522432c630aa6247a"
    "SKIP"
)

noextract=("${source[@]%%::*}")
options=('!strip' '!debug')

prepare() {
    chmod +x "${srcdir}/5ire-${pkgver}-x86_64.AppImage"
    "${srcdir}/5ire-${pkgver}-x86_64.AppImage" --appimage-extract > /dev/null
    sed 's@AppRun@/usr/bin/5ire@g' -i "${srcdir}/squashfs-root/5ire.desktop"
}

package() {
    install -Dm644 "${srcdir}/squashfs-root/5ire.desktop" "${pkgdir}/usr/share/applications/5ire.desktop"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    find "${srcdir}/squashfs-root" -type f |
        sed "s@^${srcdir}/squashfs-root/@@g" |
        xargs -I{} install -D "${srcdir}/squashfs-root/{}" "${pkgdir}/opt/5ire/{}"

    mkdir -p "${pkgdir}/usr/bin"

    ln -sf "/opt/5ire/5ire" "${pkgdir}/usr/bin/5ire"

    find "${srcdir}/squashfs-root/usr/share/icons/hicolor" -type f -name '5ire.png' |
        sed "s@^${srcdir}/squashfs-root/@@g" |
        xargs -I{} install -Dm644 "${srcdir}/squashfs-root/{}" "${pkgdir}/{}"
}
