# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Claude Sonnet 4.6.

pkgname=whitelist-bypass-creator-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="WhitelistBypass Creator — bypass platform restrictions"
arch=('x86_64')
url="https://github.com/kulikov0/whitelist-bypass"
license=('MIT')
options=('!strip')
depends=('fuse2')
makedepends=('squashfs-tools')
source=("WhitelistBypass.Creator-${pkgver}-x86_64.AppImage::https://github.com/kulikov0/whitelist-bypass/releases/download/v${pkgver}/WhitelistBypass.Creator-${pkgver}-x86_64.AppImage")
sha256sums=('e7eeef9a407fcf4acc84a32f8b757a0b52b0de53de470d7fc89bcdf73c5c2f1a')

prepare() {
    cp -L "${srcdir}/WhitelistBypass.Creator-${pkgver}-x86_64.AppImage" "${srcdir}/real-appimage"
    chmod +x "${srcdir}/real-appimage"
    "${srcdir}/real-appimage" --appimage-extract >/dev/null 2>&1
}

package() {
    local _src="${srcdir}/real-appimage"
    mkdir -p "${pkgdir}/usr/bin"
    cat "${_src}" > "${pkgdir}/usr/bin/whitelist-bypass-creator"
    chmod 755 "${pkgdir}/usr/bin/whitelist-bypass-creator"

    cd "${srcdir}/squashfs-root"
    install -Dm644 "whitelist-bypass-creator.desktop" "${pkgdir}/usr/share/applications/whitelist-bypass-creator.desktop"
    sed -i 's/Exec=AppRun/Exec=whitelist-bypass-creator/' "${pkgdir}/usr/share/applications/whitelist-bypass-creator.desktop"

    install -Dm644 "usr/share/icons/hicolor/512x512/apps/whitelist-bypass-creator.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/whitelist-bypass-creator.png"
}