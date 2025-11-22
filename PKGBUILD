# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgbase=obsidian
pkgname=(${pkgbase}-{bin,appimage})
pkgver=1.10.3
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/obsidianmd/obsidian-releases"
license=('custom')
conflicts=('obsidian')
provides=('obsidian')
source=(
    "obsidian-bin"
    "obsidian-appimage"
    )
source_x86_64=(
    "${pkgbase}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/obsidian_${pkgver}_amd64.deb"
    "Obsidian-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/Obsidian-${pkgver}.AppImage"
)
source_aarch64=(
    "Obsidian-${pkgver}-aarch64.AppImage::${url}/releases/download/v${pkgver}/Obsidian-${pkgver}-arm64.AppImage"
)

sha256sums=('a94e20705d4b67501f225d74f4460b746a258e52aa6bc522aed1e26ac42dbef9'
            'febbd56ffe802968b7e848b468f2f2762f5927d6934b4ee70569977aa5d3f843')
sha256sums_x86_64=('c2745551c3f4113d96625491060f320c57d315905541ff0e30a694dbe3a9b39c'
                   '713a0e52a44d3faec1d2566c4ba10d63c49e190c76de09b43bc80a97a8fb6b90')
sha256sums_aarch64=('e01026f643d4a20d1b732bfe33c9ad5cdfd3dde7b9f3ba9b79d6c63b8b78f44e')
noextract=("Obsidian-${pkgver}-${CARCH}.AppImage")

package_obsidian-bin() {
    pkgdesc="A powerful knowledge base that works on top of a local folder of plain text Markdown files (Official binary package with bundled Electron)"
    arch=('x86_64')
    depends=(
        'gtk3'
        'libnotify'
        'nss'
        'libxss'
        'libxtst'
        'xdg-utils'
        'at-spi2-core'
        'util-linux-libs'
        'libsecret'
    )
    optdepends=('libappindicator-gtk3: tray icon support')
    install="obsidian-bin.install"

    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
    sed -i "s|/opt/Obsidian/obsidian|obsidian|" "${pkgdir}/usr/share/applications/obsidian.desktop"
    install -Dm755 "${srcdir}/obsidian-bin" "${pkgdir}/usr/bin/obsidian"
    install -Dm644 "${pkgdir}/opt/Obsidian/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
    install -Dm644 "${pkgdir}/opt/Obsidian/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}

package_obsidian-appimage() {
    pkgdesc="A powerful knowledge base that works on top of a local folder of plain text Markdown files (AppImage version)"
    arch=('x86_64' 'aarch64')
    options=(!strip)
    depends=(
        'zlib'
        'fuse2'
    )
    install="obsidian-appimage.install"

    chmod +x "${srcdir}/Obsidian-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/Obsidian-${pkgver}-${CARCH}.AppImage" --appimage-extract

    sed -i "s|AppRun|obsidian|" "${srcdir}/squashfs-root/obsidian.desktop"

    install -Dm755 "${srcdir}/Obsidian-${pkgver}-${CARCH}.AppImage" "${pkgdir}/opt/obsidian-appimage/obsidian.AppImage"
    install -Dm755 "${srcdir}/obsidian-appimage" "${pkgdir}/usr/bin/obsidian"
    install -Dm644 "${srcdir}/squashfs-root/obsidian.desktop" "${pkgdir}/usr/share/applications/obsidian.desktop"
    install -Dm644 "${srcdir}/squashfs-root/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
    install -Dm644 "${srcdir}/squashfs-root/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
    cp -rf "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
}
