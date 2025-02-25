# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgname=obsidian-appimage
pkgver=1.8.7
pkgrel=1
pkgdesc="A powerful knowledge base that works on top of a local folder of plain text Markdown files (AppImage version)"
arch=('x86_64' 'aarch64')
url="https://obsidian.md"
license=('custom')
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
provides=('obsidian')
# Define sources
source=('obsidian')
source_x86_64=("Obsidian-${pkgver}-x86_64.AppImage::https://github.com/obsidianmd/obsidian-releases/releases/download/v${pkgver}/Obsidian-${pkgver}.AppImage")
source_aarch64=("Obsidian-${pkgver}-aarch64.AppImage::https://github.com/obsidianmd/obsidian-releases/releases/download/v${pkgver}/Obsidian-${pkgver}-arm64.AppImage")
sha256sums=('9280d0551b1a3c45e20409b6bab1f68217ab7d965341a686efc7b7c48141e4f0')
sha256sums_x86_64=('5a5d1ced88b269c31bd8c9f620783d85c5420df293a888a89e33fa6afa4f7acf')
sha256sums_aarch64=('5a5d1ced88b269c31bd8c9f620783d85c5420df293a888a89e33fa6afa4f7acf')
appimage=Obsidian-${pkgver}-${CARCH}.AppImage
noextract=(${appimage})

prepare() {
    chmod +x "${appimage}"
    ./"${appimage}" --appimage-extract
}

package() {
    # Install AppImage
    install -Dm755 "${srcdir}/${appimage}" "${pkgdir}/opt/obsidian/obsidian.AppImage"
    # Fix .desktop file
    sed -i \
        -e "s|Exec=AppRun|Exec=/usr/bin/obsidian|" \
        -e "s|Icon=.*|Icon=obsidian|" \
        "squashfs-root/obsidian.desktop"
    # Install .desktop file
    install -Dm644 "${srcdir}/squashfs-root/obsidian.desktop" "${pkgdir}/usr/share/applications/obsidian.desktop"
    # Install icons
    cp -rf "${srcdir}/squashfs-root/usr/share" "${pkgdir}/usr"
    # Symlink executable file
    install -Dm755 "${srcdir}/obsidian" "${pkgdir}/usr/bin/obsidian"
}
