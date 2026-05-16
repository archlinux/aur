pkgname=multica-desktop-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="The open-source managed agents platform. Turn coding agents into real teammates — assign tasks, track progress, compound skills - Desktop GUI"
arch=(x86_64 aarch64)
url="https://github.com/multica-ai/multica"
license=(MIT)

depends=("fuse2")
options=(!strip !debug)
conflicts=("multica-desktop")
provides=(multica-desktop)

_appimage="multica-desktop-${pkgver}-linux-${arch}.AppImage"
source=("${_appimage}::https://github.com/multica-ai/multica/releases/download/v0.3.1/multica-desktop-0.3.1-linux-x86_64.AppImage")
sha256sums=('ecf953f4ea64872535a49e251d566d4b044eb8a117c6ba8d5dbde5fdfaf700df')
noextract=("${_appimage}")

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

package() {
    install -Dm755 "${srcdir}/${_appimage}" \
        "${pkgdir}/opt/${pkgname}/${_appimage}"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/multica-desktop"

    # Install extra files from srcdir (e.g., LICENSE alongside AppImage)

    cd "${srcdir}/squashfs-root"
    find . -maxdepth 1 -name '*.desktop' -exec \
        install -Dm644 {} "${pkgdir}/usr/share/applications/multica-desktop.desktop" \;

    sed -i "s|Exec=.*|Exec=multica-desktop %U|" \
        "${pkgdir}/usr/share/applications/multica-desktop.desktop"
    sed -i "s|Icon=.*|Icon=multica-desktop|" \
        "${pkgdir}/usr/share/applications/multica-desktop.desktop"
    if [ -d usr/share/icons ]; then
        # Install icon files directly with binary_name — no cp+mv rename needed
        find usr/share/icons -type f \( -name '*.png' -o -name '*.svg' \) | while read -r icon; do
            relpath="${icon#usr/share/icons/}"
            dir="${pkgdir}/usr/share/icons/$(dirname "$relpath")"
            base=$(basename "$icon")
            ext="${base##*.}"
            install -Dm644 "$icon" "${dir}/multica-desktop.${ext}"
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
        install -Dm644 "$f" "${pkgdir}/usr/share/pixmaps/multica-desktop.${ext}"
        break
    done
}