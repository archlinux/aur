# Maintainer: louis4545 <la.programmations@gmail.com>
pkgname=superset-desktop-bin
pkgver=1.21.0
pkgrel=1
pkgdesc="IDE for the AI Agents Era - Run an army of Claude Code, Codex, etc. on your machine"
arch=('x86_64')
url="https://superset.sh"
license=('custom')
depends=('fuse2' 'hicolor-icon-theme')
options=(!strip !debug)
_appimage="superset-${pkgver}-x86_64.AppImage"
source=("${_appimage}::https://github.com/superset-sh/superset/releases/download/desktop-v${pkgver}/${_appimage}")
sha256sums=('3bd9b5e8f9d1103c944c4dd3f88020db5c9b59525fb29df49241725d9235fe0c')
noextract=("${_appimage}")

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

package() {
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_appimage}"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/superset-desktop"

    cd "${srcdir}/squashfs-root"

    # Desktop file
    find . -maxdepth 1 -name '*.desktop' -exec \
        install -Dm644 {} "${pkgdir}/usr/share/applications/superset-desktop.desktop" \;

    # Patch desktop file paths
    sed -i "s|Exec=.*|Exec=superset-desktop %U|" "${pkgdir}/usr/share/applications/superset-desktop.desktop"
    sed -i "s|Icon=.*|Icon=superset-desktop|" "${pkgdir}/usr/share/applications/superset-desktop.desktop"

    # Icons
    if [ -d usr/share/icons ]; then
        cp -r usr/share/icons "${pkgdir}/usr/share/"
        find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 {} +
        find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 {} +
        find "${pkgdir}/usr/share/icons" -name '*.png' -o -name '*.svg' | while read -r icon; do
            dir=$(dirname "$icon")
            base=$(basename "$icon")
            ext="${base##*.}"
            mv "$icon" "${dir}/superset-desktop.${ext}"
        done
    fi

    # Fallback: icon at root of squashfs
    for ext in png svg; do
        if [ -f *.${ext} ]; then
            install -Dm644 *.${ext} "${pkgdir}/usr/share/pixmaps/superset-desktop.${ext}"
            break
        fi
    done
}
