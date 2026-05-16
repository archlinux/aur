pkgname=terax-ai-bin
pkgver=0.6.6
pkgrel=1
pkgdesc="Modern AI terminal powered by Tauri"
arch=(x86_64)
url="https://github.com/crynta/terax-ai"
license=(Apache-2.0)

depends=("fuse2")
options=(!strip !debug)
conflicts=("terax" "terax-bin")
provides=(terax)

_appimage="Terax_${pkgver}_amd64.AppImage"
source=("${_appimage}::https://github.com/crynta/terax-ai/releases/download/v0.6.6/Terax_0.6.6_amd64.AppImage")
sha256sums=('e0db38b73fd28c4c482944cffd4a3be09c321397c405117da470f3023cc354be')
noextract=("${_appimage}")

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

package() {
    install -Dm755 "${srcdir}/${_appimage}" \
        "${pkgdir}/opt/${pkgname}/${_appimage}"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/terax"

    # Install extra files from srcdir (e.g., LICENSE alongside AppImage)

    cd "${srcdir}/squashfs-root"
    find . -maxdepth 1 -name '*.desktop' -exec \
        install -Dm644 {} "${pkgdir}/usr/share/applications/terax.desktop" \;

    sed -i "s|Exec=.*|Exec=terax %U|" \
        "${pkgdir}/usr/share/applications/terax.desktop"
    sed -i "s|Icon=.*|Icon=terax|" \
        "${pkgdir}/usr/share/applications/terax.desktop"
    if [ -d usr/share/icons ]; then
        # Install icon files directly with binary_name — no cp+mv rename needed
        find usr/share/icons -type f \( -name '*.png' -o -name '*.svg' \) | while read -r icon; do
            relpath="${icon#usr/share/icons/}"
            dir="${pkgdir}/usr/share/icons/$(dirname "$relpath")"
            base=$(basename "$icon")
            ext="${base##*.}"
            install -Dm644 "$icon" "${dir}/terax.${ext}"
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
        install -Dm644 "$f" "${pkgdir}/usr/share/pixmaps/terax.${ext}"
        break
    done
}