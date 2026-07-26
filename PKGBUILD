pkgname=bedrock-on-linux-bin
pkgver=2.1.1
pkgrel=1
pkgdesc="Run Minecraft Bedrock for Windows on Linux with native Microsoft identity and multiplayer"
arch=(x86_64)
url="https://github.com/Wyze3306/BedrockOnLinux"
license=(MIT)

depends=("ca-certificates" "curl" "fontconfig" "fuse2" "glibc" "libx11" "libxft" "tar" "vulkan-driver" "xdg-utils" "xorg-xrandr" "zstd")
optdepends=("xorg-xwayland: launcher and game support in Wayland sessions")
options=(!strip !debug)
conflicts=("bedrock-on-linux")
provides=(bedrock-on-linux)

_appimage="BedrockOnLinux-${pkgver}-x86_64.AppImage"
source=("${_appimage}::https://github.com/Wyze3306/BedrockOnLinux/releases/download/v2.1.1/BedrockOnLinux-2.1.1-x86_64.AppImage")
sha256sums=('a280f2873ec147d2337c0daafd7ff21e604b0eebff336137073ed44334b3b5e4')
noextract=("${_appimage}")

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

package() {
    install -Dm755 "${srcdir}/${_appimage}" \
        "${pkgdir}/opt/${pkgname}/${_appimage}"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/bedrock-on-linux"

    # Install extra files from srcdir (e.g., LICENSE alongside AppImage)
    install -Dm644 "${srcdir}/squashfs-root/usr/share/licenses/bedrock-on-linux/LICENSE" "${pkgdir}/usr/share/licenses/bedrock-on-linux-bin/LICENSE"

    cd "${srcdir}/squashfs-root"
    find . -maxdepth 1 -name '*.desktop' -exec \
        install -Dm644 {} "${pkgdir}/usr/share/applications/bedrock-on-linux.desktop" \;

    sed -i "s|Exec=.*|Exec=bedrock-on-linux %U|" \
        "${pkgdir}/usr/share/applications/bedrock-on-linux.desktop"
    sed -i "s|Icon=.*|Icon=bedrock-on-linux|" \
        "${pkgdir}/usr/share/applications/bedrock-on-linux.desktop"
    if [ -d usr/share/icons ]; then
        cp -r usr/share/icons "${pkgdir}/usr/share/"
        find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 {} +
        find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 {} +
        find "${pkgdir}/usr/share/icons" -name '*.png' -o -name '*.svg' | while read -r icon; do
            dir=$(dirname "$icon")
            base=$(basename "$icon")
            ext="${base##*.}"
            name="${base%.*}"
            [ "$name" = "bedrock-on-linux" ] && continue
            mv "$icon" "${dir}/bedrock-on-linux.${ext}"
        done
    fi
    # Install root-level icons to pixmaps (first matching png or svg)
    for f in *.png *.svg; do
        [ -f "$f" ] || continue
        ext="${f##*.}"
        install -Dm644 "$f" "${pkgdir}/usr/share/pixmaps/bedrock-on-linux.${ext}"
        break
    done
}