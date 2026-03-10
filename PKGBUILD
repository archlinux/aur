# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=spotify-qt-bin
pkgver=4.0.3
pkgrel=2
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
sha256sums_x86_64=('759b3468889b65d39c6a20ea1d7237afa2f79f68ee130602ceca4e16fb08fd25')
sha256sums_aarch64=('d333678458a25143e0d794fa2d01830bff5b57d13422b4f40dacee749c9bd4d5')

latestver() {
    curl -fsSL 'https://api.github.com/repos/kraxarn/spotify-qt/releases/latest' | jq -r 'select(any(.assets[]?; .name | test("^spotify-qt-v[0-9.]+-x86_64\\.AppImage$")) and any(.assets[]?; .name | test("^spotify-qt-v[0-9.]+-aarch64\\.AppImage$"))) | .tag_name' |
    sed -E 's/^v//'
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
