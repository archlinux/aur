# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=spotify-qt-bin
pkgver=4.0.4
pkgrel=1
pkgdesc="Lightweight Spotify client using Qt"
arch=('x86_64' 'aarch64')
url="https://github.com/kraxarn/spotify-qt"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-svg' 'hicolor-icon-theme')
optdepends=('librespot: Recommended playback client'
            'qt6-wayland: Wayland support')
options=('!debug')
provides=('spotify-qt')
conflicts=('spotify-qt')

_appimage="${pkgname%-bin}-v${pkgver}"
source_x86_64=("${_appimage}-x86_64.AppImage::${url}/releases/download/v${pkgver}/spotify-qt-v${pkgver}-x86_64.AppImage")
source_aarch64=("${_appimage}-aarch64.AppImage::${url}/releases/download/v${pkgver}/spotify-qt-v${pkgver}-aarch64.AppImage")
sha256sums_x86_64=('f92c3e446267bc7e10f1b016232ba3f2d74f05e0be2c5ac132c403ae79a0e21f')
sha256sums_aarch64=('dbe0f455784e33a0acc11d9bf0e5062545f77360e44898f613a4d5bcbc95b668')

latestver() {
    gh api --paginate repos/kraxarn/spotify-qt/releases --jq '.[] | select(.prerelease == false and .draft == false and any(.assets[]; .name | test("^spotify-qt-v[0-9.]+-x86_64\\.AppImage$")) and any(.assets[]; .name | test("^spotify-qt-v[0-9.]+-aarch64\\.AppImage$"))) | .tag_name' |
    head -1 | sed -E 's/^v//'
}

prepare() {
    chmod +x "${_appimage}-${CARCH}.AppImage"
    "./${_appimage}-${CARCH}.AppImage" --appimage-extract >/dev/null 2>&1
}

package() {
    cd squashfs-root

    install -Dm755 usr/bin/spotify-qt "${pkgdir}/usr/bin/spotify-qt"
    install -Dm644 usr/share/icons/hicolor/scalable/apps/spotify-qt.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/spotify-qt.svg"
    install -Dm644 usr/share/applications/spotify-qt.desktop "${pkgdir}/usr/share/applications/spotify-qt.desktop"
}
