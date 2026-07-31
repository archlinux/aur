# Maintainer: Your Name <your@email.com>
pkgbase=skerry-ssh-appimage
pkgname=skerry
pkgver=0.2.1
pkgrel=1
pkgdesc="Cross-platform SSH client with a single core"
arch=('x86_64')
url="https://github.com/SeCherkasov/SkerrySSH"
license=('GPL-3.0-only')
depends=('fuse2')
makedepends=()
optdepends=()
source=("${pkgname}-${pkgver}-x86_64.AppImage::https://github.com/SeCherkasov/SkerrySSH/releases/download/v${pkgver}/${pkgname^}-${pkgver}-x86_64.AppImage")
sha256sums=('SKIP')

prepare() {
    chmod +x "${srcdir}/${pkgname}-${pkgver}-x86_64.AppImage"
}

build() {
    # Extract the AppImage contents into a subdirectory
    cd "${srcdir}"
    "./${pkgname}-${pkgver}-x86_64.AppImage" --appimage-extract
}

package() {
    # Install extracted AppImage tree to /opt
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -a "${srcdir}/squashfs-root/." "${pkgdir}/opt/${pkgname}/"

    # Make launcher executable (AppRun is a shell script, bin/Skerry is the native binary)
    chmod +x "${pkgdir}/opt/${pkgname}/AppRun"
    chmod +x "${pkgdir}/opt/${pkgname}/bin/Skerry"

    # Symlink AppRun into /usr/bin so the app is on $PATH
    install -dm755 "${pkgdir}/usr/bin"
    ln -sf "/opt/${pkgname}/AppRun" "${pkgdir}/usr/bin/${pkgname}"

    # Install the .desktop file
    install -Dm644 "${pkgdir}/opt/${pkgname}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Install icon
    install -Dm644 "${pkgdir}/opt/${pkgname}/${pkgname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"

    # Fix the Exec and Icon paths in the desktop file to use absolute/system paths
    sed -i "s|^Exec=.*|Exec=/usr/bin/${pkgname}|" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    sed -i "s|^Icon=.*|Icon=${pkgname}|" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
