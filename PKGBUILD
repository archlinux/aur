pkgname=superset-bin
pkgver=1.21.0
pkgrel=1
pkgdesc="Code Editor for the AI Agents Era - Run an army of Claude Code, Codex, etc. on your machine"
arch=(x86_64)
url="https://superset.sh"
license=(custom)

depends=("fuse2" "hicolor-icon-theme")
options=(!strip !debug)
conflicts=("superset-desktop-bin")
provides=(superset-desktop)

_appimage="superset-${pkgver}-${arch}.AppImage"
source=("${_appimage}::https://github.com/superset-sh/superset/releases/download/desktop-v1.21.0/superset-1.21.0-x86_64.AppImage")
sha256sums=('3bd9b5e8f9d1103c944c4dd3f88020db5c9b59525fb29df49241725d9235fe0c')
noextract=("${_appimage}")

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

package() {
    install -Dm755 "${srcdir}/${_appimage}" \
        "${pkgdir}/opt/${pkgname}/${_appimage}"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/superset-desktop"

    # Install extra files from srcdir (e.g., LICENSE alongside AppImage)

    cd "${srcdir}/squashfs-root"
    find . -maxdepth 1 -name '*.desktop' -exec \
        install -Dm644 {} "${pkgdir}/usr/share/applications/superset-desktop.desktop" \;

    sed -i "s|Exec=.*|Exec=superset-desktop %U|" \
        "${pkgdir}/usr/share/applications/superset-desktop.desktop"
    sed -i "s|Icon=.*|Icon=superset-desktop|" \
        "${pkgdir}/usr/share/applications/superset-desktop.desktop"
    if [ -d usr/share/icons ]; then
        cp -r usr/share/icons "${pkgdir}/usr/share/"
        find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 {} +
        find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 {} +
        find "${pkgdir}/usr/share/icons" -name '*.png' -o -name '*.svg' | while read -r icon; do
            dir=$(dirname "$icon")
            base=$(basename "$icon")
            ext="${base##*.}"
            name="${base%.*}"
            [ "$name" = "superset-desktop" ] && continue
            mv "$icon" "${dir}/superset-desktop.${ext}"
        done
    fi
    # Install root-level icons to pixmaps (first matching png or svg)
    for f in *.png *.svg; do
        [ -f "$f" ] || continue
        ext="${f##*.}"
        install -Dm644 "$f" "${pkgdir}/usr/share/pixmaps/superset-desktop.${ext}"
        break
    done
}