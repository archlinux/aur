pkgname=superset-bin
pkgver=1.9.6
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
source=("${_appimage}::https://github.com/superset-sh/superset/releases/download/desktop-v1.9.6/superset-1.9.6-x86_64.AppImage")
sha256sums=('61bfc49f8845e8d2c487db102bb24771b0bc1dc2ad04c2df242ed36b1a0bb66a')
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
        # Install icon files directly with binary_name — no cp+mv rename needed
        find usr/share/icons -type f \( -name '*.png' -o -name '*.svg' \) | while read -r icon; do
            relpath="${icon#usr/share/icons/}"
            dir="${pkgdir}/usr/share/icons/$(dirname "$relpath")"
            base=$(basename "$icon")
            ext="${base##*.}"
            install -Dm644 "$icon" "${dir}/superset-desktop.${ext}"
        done
        # Copy non-icon files (index.theme, etc.) as-is
        find usr/share/icons -type f ! \( -name '*.png' -o -name '*.svg' \) | while read -r f; do
            relpath="${f#usr/share/icons/}"
            install -Dm644 "$f" "${pkgdir}/usr/share/icons/${relpath}"
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