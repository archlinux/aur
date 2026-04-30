pkgname=warp-ai-terminal-bin
pkgver=0.2026.04.27.15.32.stable_03
pkgrel=1
pkgdesc="Blazingly fast, AI-powered terminal with modern UX"
arch=(x86_64 aarch64)
url="https://www.warp.dev"
license=(AGPL)

depends=("fuse2")
options=(!strip !debug)

_appimage="Warp-x86_64.AppImage"
source=("${_appimage}::https://releases.warp.dev/stable/v0.2026.04.27.15.32.stable_03/Warp-x86_64.AppImage")
sha256sums=('84b9d6fb86a942b32d839e2bee62c6bdcf4f3998675292725fa9faf37fdfc745')
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
            mv "$icon" "${dir}/warp.${ext}"
        done
    fi

    for ext in png svg; do
        if [ -f *.${ext} ]; then
            install -Dm644 *.${ext} "${pkgdir}/usr/share/pixmaps/warp.${ext}"
            break
        fi
    done
}