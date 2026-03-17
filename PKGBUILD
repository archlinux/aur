# Maintainer: Joaquim Madureira <joca at jocadbz dot xyz>
pkgname=tinywiibackupmanager-bin
pkgver=5.1.27
pkgrel=1
pkgdesc="A tiny game backup and homebrew app manager for the Wii"
arch=('x86_64' 'aarch64')
url="https://github.com/mq1/TinyWiiBackupManager"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme')
makedepends=('fuse2')
options=('!strip' '!debug')

source_x86_64=(
    "TinyWiiBackupManager-${pkgver}-linux-x86_64.AppImage::https://github.com/mq1/TinyWiiBackupManager/releases/download/v${pkgver}/TinyWiiBackupManager-v${pkgver}-linux-x86_64.AppImage"
)
source_aarch64=(
    "TinyWiiBackupManager-${pkgver}-linux-aarch64.AppImage::https://github.com/mq1/TinyWiiBackupManager/releases/download/v${pkgver}/TinyWiiBackupManager-v${pkgver}-linux-arm64.AppImage"
)

noextract=(
    "TinyWiiBackupManager-${pkgver}-linux-x86_64.AppImage"
    "TinyWiiBackupManager-${pkgver}-linux-arm64.AppImage"
)

sha256sums_x86_64=('928ca896214c44ab03e1d604512aae41d5bc708837b05773b957ba4fe97623a5')
sha256sums_aarch64=('fa51061f2653803c56219467e4f8f3eb76d4f190ec77a9b69cb23653f42505ef')

package() {
    cd "$srcdir"

    local appimage="TinyWiiBackupManager-${pkgver}-linux-${CARCH}.AppImage"

    chmod +x "$appimage"

    ./"$appimage" --appimage-extract >/dev/null 2>&1

    rm -f squashfs-root/TinyWiiBackupManager.png
    rm -f squashfs-root/TinyWiiBackupManager.desktop
    rm -f squashfs-root/AppRun
    rm -rf squashfs-root/usr/lib
    rm -rf squashfs-root/usr/share/pixmaps
    rm -rf squashfs-root/usr/share/icons/hicolor/{16x16,32x32,64x64,128x128,256x256,scalable}

    cp -a --no-preserve=ownership squashfs-root/. "$pkgdir/"

    rm -rf squashfs-root
    rm -f "${pkgdir}/.DirIcon"
}
