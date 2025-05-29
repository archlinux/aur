# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgname=obsidian-appimage
pkgver=1.8.10
pkgrel=2
pkgdesc="A powerful knowledge base that works on top of a local folder of plain text Markdown files (AppImage version)"
arch=('x86_64' 'aarch64')
url="https://obsidian.md/"
license=('custom')
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
provides=('obsidian')
options=(!strip)
source_x86_64=("Obsidian-${pkgver}-x86_64.AppImage::https://github.com/obsidianmd/obsidian-releases/releases/download/v${pkgver}/Obsidian-${pkgver}.AppImage")
source_aarch64=("Obsidian-${pkgver}-aarch64.AppImage::https://github.com/obsidianmd/obsidian-releases/releases/download/v${pkgver}/Obsidian-${pkgver}-arm64.AppImage")
sha256sums_x86_64=('05d4bfb76ef409ace4f4e59ccafb49dbd5a537c1ec15e570b59db603ddaad715')
sha256sums_aarch64=('667378116211b95eeb89bbb72d32c7d1f6243a8891c82d81bd9e17cde1162bee')
noextract=("Obsidian-${pkgver}-${CARCH}.AppImage")

prepare() {
    chmod +x "${srcdir}/Obsidian-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/Obsidian-${pkgver}-${CARCH}.AppImage" --appimage-extract
}

build() {
    sed -i "s|AppRun|/usr/bin/obsidian|" "${srcdir}/squashfs-root/obsidian.desktop"
}

package() {
    install -Dm755 "${srcdir}/Obsidian-${pkgver}-${CARCH}.AppImage" "${pkgdir}/opt/obsidian-appimage/obsidian.AppImage"
    install -Dm755 "${srcdir}/squashfs-root/obsidian" "${pkgdir}/usr/bin/obsidian"
    install -Dm644 "${srcdir}/squashfs-root/obsidian.desktop" "${pkgdir}/usr/share/applications/obsidian.desktop"
    install -Dm644 "${srcdir}/squashfs-root/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
    install -Dm644 "${srcdir}/squashfs-root/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
    cp -rf "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
}
