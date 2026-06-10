pkgname=warp-ai-terminal-bin
pkgver=0.2026.06.03.09.49.stable_03
pkgrel=1
pkgdesc="Blazingly fast, AI-powered terminal with modern UX"
arch=(x86_64 aarch64)
url="https://www.warp.dev"
license=(AGPL)

depends=("fuse2")
options=(!strip !debug)

_appimage="Warp-x86_64.AppImage"
source=("${_appimage}::https://releases.warp.dev/stable/v0.2026.06.03.09.49.stable_03/Warp-x86_64.AppImage")
sha256sums=('4b39b70c0bd95fe2be0c1f6adf5270bb972bd07fdcbe84c173992095616c96bb')
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
        cp -r usr/share/icons "${pkgdir}/usr/share/"
        find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 {} +
        find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 {} +
        find "${pkgdir}/usr/share/icons" -name '*.png' -o -name '*.svg' | while read -r icon; do
            dir=$(dirname "$icon")
            base=$(basename "$icon")
            ext="${base##*.}"
            name="${base%.*}"
            [ "$name" = "warp" ] && continue
            mv "$icon" "${dir}/warp.${ext}"
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