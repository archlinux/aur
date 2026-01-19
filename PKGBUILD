# Maintainer: Joaquim Madureira <joca at jocadbz dot xyz>
pkgname=tinywiibackupmanager-bin
pkgver=4.9.23
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

sha256sums_x86_64=('1c2be5aedb1963aef62e8b54849bd34bf78105b26cb47042401f36e83b731213')
sha256sums_aarch64=('414e9c83ce55283b93d825aed23e30887fda10bafe8348c94bb51720031b61b6')

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
