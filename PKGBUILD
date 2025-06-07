# Maintainer: Oliver Tzeng（曾嘉禾）<olivertzeng at proton dot me>

_pkgname="Pixiv Viewer"
pkgname="pixiv-viewer-bin"
pkgver=$(curl -s https://api.github.com/repos/asadahimeka/pixiv-viewer-app/releases/latest | grep '"tag_name":' | cut -d '"' -f 4 | sed 's/^v//')
pkgrel=1
pkgdesc="App version of pixiv-viewer, supports Android/Windows/macOS/iOS/Linux."
arch=('x86_64')
url="https://github.com/asadahimeka/pixiv-viewer-app"
license=('MIT')
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
_appimage="Pixiv-Viewer_${pkgver}_amd64.AppImage"
source_x86_64=("${_appimage}::https://github.com/asadahimeka/pixiv-viewer-app/releases/download/v${pkgver}/Pixiv-Viewer_${pkgver}_amd64.AppImage")
sha256sums=('SKIP')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

# Fix .desktop file
build() {
    sed -i "s|^Exec=.*|Exec=/usr/bin/${_pkgname}|" "squashfs-root/Pixiv-Viewer.desktop"

}

package() {
    install -Dm755 "${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "squashfs-root/Pixiv-Viewer.desktop" \
        "${pkgdir}/usr/share/applications/Pixiv-Viewer.desktop"
    # copy icon
    install -Dm644 "squashfs-root/Pixiv-Viewer.png" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/Pixiv-Viewer.png"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
        echo "${pkgdir}/usr/bin/${_pkgname}"
    }

