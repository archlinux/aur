# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgbase=obsidian
pkgname=(${pkgbase}-{bin,appimage})
pkgver=1.9.10
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/obsidianmd/obsidian-releases"
license=('custom')
conflicts=('obsidian')
provides=('obsidian')
options=(!strip)
source=("obsidian")
source_x86_64=(
    "${pkgbase}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/obsidian_${pkgver}_amd64.deb"
    "Obsidian-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/Obsidian-${pkgver}.AppImage"
)
source_aarch64=(
    "Obsidian-${pkgver}-aarch64.AppImage::${url}/releases/download/v${pkgver}/Obsidian-${pkgver}-arm64.AppImage"
)

sha256sums=('56e6892346fb16287fd4a3c8d521d51e620604052ac8aee5be7b6a8fee9452c0')
sha256sums_x86_64=('44c8eeb0797c332dbf4533aaaa126a31896db8c207dac9cda61beba7c33be257'
                   '24471d25ed4d7d797a20a8ddf7b81ec43ae337f9ce495514dfdbb893307472b7')
sha256sums_aarch64=('0ef8b8a77946869869aa85b74bf97959ef4f12129557a1b9a407885bdd808af6')
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
    install="obsidian.install"

    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
    install -Dm644 "${pkgdir}/opt/Obsidian/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
    install -Dm644 "${pkgdir}/opt/Obsidian/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}

package_obsidian-appimage() {
    pkgdesc="A powerful knowledge base that works on top of a local folder of plain text Markdown files (AppImage version)"
    arch=('x86_64' 'aarch64')
    depends=(
        'zlib'
        'fuse2'
    )

    chmod +x "${srcdir}/Obsidian-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/Obsidian-${pkgver}-${CARCH}.AppImage" --appimage-extract

    sed -i "s|AppRun|/usr/bin/obsidian|" "${srcdir}/squashfs-root/obsidian.desktop"

    install -Dm755 "${srcdir}/Obsidian-${pkgver}-${CARCH}.AppImage" "${pkgdir}/opt/obsidian-appimage/obsidian.AppImage"
    install -Dm755 "${srcdir}/obsidian" "${pkgdir}/usr/bin/obsidian"
    install -Dm644 "${srcdir}/squashfs-root/obsidian.desktop" "${pkgdir}/usr/share/applications/obsidian.desktop"
    install -Dm644 "${srcdir}/squashfs-root/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
    install -Dm644 "${srcdir}/squashfs-root/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
    cp -rf "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
}
