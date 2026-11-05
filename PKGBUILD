# Maintainer: Eren <lumexren@gmail.com>

pkgname=vscodium-code-bin
_pkgname=VSCodium
pkgver=1.143.17232
pkgrel=1
pkgdesc="VSCodium repackaged with full VS Code branding, clean desktop integration, and flags wrapper"
arch=('x86_64')
url="https://github.com/lumexren/vscodium-code"
license=('MIT')
depends=(
    'fontconfig' 'libxtst' 'gtk3' 'cairo' 'alsa-lib' 'nss' 'gcc-libs' 'libnotify' 'libxss'
    'glibc>=2.28-4' 'bash'
)
optdepends=(
    'gvfs: For move to trash functionality'
    'libdbusmenu-glib: For KDE global menu'
)
options=('!emptydirs' '!strip' '!debug')
provides=('vscode' 'codium' 'vscodium' 'vscodium-bin' 'visual-studio-code-bin')
conflicts=('vscodium' 'vscodium-bin' 'codium')
replaces=('vscodium')
install="${pkgname}.install"

source=(
    "https://github.com/VSCodium/vscodium/releases/download/${pkgver}/${_pkgname}-linux-x64-${pkgver}.tar.gz"
    'codium'
    'code.desktop'
    'code-url-handler.desktop'
    'vscode.svg'
    'vscode_1024.png'
)
noextract=("${_pkgname}-linux-x64-${pkgver}.tar.gz")

sha256sums=(
    'ca1895aa040bd91a09c709d79eac7862d8c1aa0237fdc25b503deeb8bcd87efd'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

prepare() {
    mkdir -p "${srcdir}/vscodium-extracted"
    bsdtar -xf "${srcdir}/${_pkgname}-linux-x64-${pkgver}.tar.gz" -C "${srcdir}/vscodium-extracted"
}

package() {
    install -d -m755 "${pkgdir}/usr/share/vscodium"
    install -d -m755 "${pkgdir}/usr/bin"
    install -d -m755 "${pkgdir}/usr/share/applications"
    install -d -m755 "${pkgdir}/usr/share/pixmaps"
    install -d -m755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps"

    # Copy binary files
    cp -r "${srcdir}/vscodium-extracted/"* "${pkgdir}/usr/share/vscodium/"

    # Patch package.json desktopName
    sed -i 's/"desktopName": "codium.desktop"/"desktopName": "code.desktop"/' "${pkgdir}/usr/share/vscodium/resources/app/package.json"

    # Replace internal electron window icon
    install -D -m644 "${srcdir}/vscode_1024.png" "${pkgdir}/usr/share/vscodium/resources/app/resources/linux/code.png"

    # Install wrapper script and symlinks
    install -D -m755 "${srcdir}/codium" "${pkgdir}/usr/bin/codium"
    ln -s codium "${pkgdir}/usr/bin/code"
    ln -s codium "${pkgdir}/usr/bin/vscodium"

    # Install desktop files (Only code.desktop is installed!)
    install -D -m644 "${srcdir}/code.desktop" "${pkgdir}/usr/share/applications/code.desktop"
    install -D -m644 "${srcdir}/code-url-handler.desktop" "${pkgdir}/usr/share/applications/code-url-handler.desktop"

    # Install pixmaps
    install -D -m644 "${srcdir}/vscode_1024.png" "${pkgdir}/usr/share/pixmaps/vscodium.png"
    install -D -m644 "${srcdir}/vscode_1024.png" "${pkgdir}/usr/share/pixmaps/code.png"
    install -D -m644 "${srcdir}/vscode_1024.png" "${pkgdir}/usr/share/pixmaps/vscode.png"

    # Install icons
    install -D -m644 "${srcdir}/vscode.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/vscode.svg"
    install -D -m644 "${srcdir}/vscode.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/vscodium.svg"
    install -D -m644 "${srcdir}/vscode.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/codium.svg"

    # License
    install -D -m644 "${pkgdir}/usr/share/vscodium/resources/app/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
