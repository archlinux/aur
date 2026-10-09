pkgname=warp-ai-terminal-bin
pkgver=0.2026.10.07.08.29.stable_00
pkgrel=1
pkgdesc="Blazingly fast, AI-powered terminal with modern UX"
arch=(x86_64 aarch64)
url="https://www.warp.dev"
license=(AGPL)

depends=("fuse2")
options=(!strip !debug)

_appimage="Warp-x86_64.AppImage"
source=("${_appimage}::https://releases.warp.dev/stable/v0.2026.10.07.08.29.stable_00/Warp-x86_64.AppImage")
sha256sums=('4e2f005f8a92b6cc96b96766f54703f4fff847552a38afe7dbb375ea2727e55f')
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