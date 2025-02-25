# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgname=obsidian-appimage
pkgver=1.8.7
pkgrel=1
pkgdesc="A powerful knowledge base that works on top of a local folder of plain text Markdown files (AppImage version)"
arch=('x86_64' 'aarch64')
url="https://obsidian.md/"
license=('custom')
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
provides=('obsidian')
source=('obsidian')
source_x86_64=("Obsidian-${pkgver}-x86_64.AppImage::https://github.com/obsidianmd/obsidian-releases/releases/download/v${pkgver}/Obsidian-${pkgver}.AppImage")
source_aarch64=("Obsidian-${pkgver}-aarch64.AppImage::https://github.com/obsidianmd/obsidian-releases/releases/download/v${pkgver}/Obsidian-${pkgver}-arm64.AppImage")
sha256sums=('56e6892346fb16287fd4a3c8d521d51e620604052ac8aee5be7b6a8fee9452c0')
sha256sums_x86_64=('5a5d1ced88b269c31bd8c9f620783d85c5420df293a888a89e33fa6afa4f7acf')
sha256sums_aarch64=('c1091b821d110e11200026fe8a6157e61b2feb87c4e4f7890a0e37f15f2861f4')
appimage=Obsidian-${pkgver}-${CARCH}.AppImage
noextract=("${appimage}")
options=(!strip)

prepare() {
    chmod +x "${srcdir}/${appimage}"
    "${srcdir}/${appimage}" --appimage-extract
}

build() {
    sed -i \
        -e "s|Exec=AppRun|Exec=/usr/bin/obsidian|" \
        -e "s|Icon=.*|Icon=obsidian|" \
        "${srcdir}/squashfs-root/obsidian.desktop"
    chmod -R 755 "${srcdir}/squashfs-root/usr/share"
}

package() {
    install -Dm755 "${srcdir}/${appimage}" "${pkgdir}/opt/obsidian-appimage/obsidian.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/obsidian.desktop" "${pkgdir}/usr/share/applications/obsidian.desktop"
    cp -rf "${srcdir}/squashfs-root/usr/share" "${pkgdir}/usr"
    install -Dm755 "${srcdir}/obsidian" "${pkgdir}/usr/bin/obsidian"
}
