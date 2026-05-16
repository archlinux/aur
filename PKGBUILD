pkgname=warp-ai-terminal-bin
pkgver=0.2026.05.13.09.15.stable_03
pkgrel=1
pkgdesc="Blazingly fast, AI-powered terminal with modern UX"
arch=(x86_64 aarch64)
url="https://www.warp.dev"
license=(AGPL)

depends=("fuse2")
options=(!strip !debug)

_appimage="Warp-x86_64.AppImage"
source=("${_appimage}::https://releases.warp.dev/stable/v0.2026.05.13.09.15.stable_03/Warp-x86_64.AppImage")
sha256sums=('48576acc7e125484273859e6c7b5fb0c7eff551d26a66e9aab608f2e93fce7ab')
noextract=("${_appimage}")

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

package() {
    install -Dm755 "${srcdir}/${_appimage}" \
        "${pkgdir}/opt/${pkgname}/${_appimage}"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/warp"

    # Install extra files from srcdir (e.g., LICENSE alongside AppImage)

    cd "${srcdir}/squashfs-root"
    find . -maxdepth 1 -name '*.desktop' -exec \
        install -Dm644 {} "${pkgdir}/usr/share/applications/warp.desktop" \;

    sed -i "s|Exec=.*|Exec=warp %U|" \
        "${pkgdir}/usr/share/applications/warp.desktop"
    sed -i "s|Icon=.*|Icon=warp|" \
        "${pkgdir}/usr/share/applications/warp.desktop"
    if [ -d usr/share/icons ]; then
        # Install icon files directly with binary_name — no cp+mv rename needed
        find usr/share/icons -type f \( -name '*.png' -o -name '*.svg' \) | while read -r icon; do
            relpath="${icon#usr/share/icons/}"
            dir="${pkgdir}/usr/share/icons/$(dirname "$relpath")"
            base=$(basename "$icon")
            ext="${base##*.}"
            install -Dm644 "$icon" "${dir}/warp.${ext}"
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
        install -Dm644 "$f" "${pkgdir}/usr/share/pixmaps/warp.${ext}"
        break
    done
}