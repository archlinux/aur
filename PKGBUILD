pkgname=buzz-appimage
pkgver=0.5.11
pkgrel=2
pkgdesc="Self-hostable workspace where humans and AI agents build together, on a relay you own"
arch=(x86_64)
url="https://github.com/block/buzz"
license=(Apache-2.0)

depends=("faac" "fuse2" "hicolor-icon-theme" "xdg-utils")
options=(!strip !debug)
conflicts=("buzz-bin" "buzz-git" "buzz-desktop-git")

_appimage="Buzz_${pkgver}_amd64.AppImage"
source=("${_appimage}::https://github.com/block/buzz/releases/download/desktop-v0.5.11/Buzz_0.5.11_amd64.AppImage")
sha256sums=('e54b06bfddbaa88d4acf5996df7c271f533487925127a47990ca9d8ad279ea79')
noextract=("${_appimage}")

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

package() {
    install -Dm755 "${srcdir}/${_appimage}" \
        "${pkgdir}/opt/${pkgname}/${_appimage}"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/buzz"

    # Install extra files from srcdir (e.g., LICENSE alongside AppImage)

    cd "${srcdir}/squashfs-root"
    find . -maxdepth 1 -name '*.desktop' -exec \
        install -Dm644 {} "${pkgdir}/usr/share/applications/buzz.desktop" \;

    sed -i "s|Exec=.*|Exec=buzz %U|" \
        "${pkgdir}/usr/share/applications/buzz.desktop"
    sed -i "s|Icon=.*|Icon=buzz|" \
        "${pkgdir}/usr/share/applications/buzz.desktop"
    if [ -d usr/share/icons ]; then
        cp -r usr/share/icons "${pkgdir}/usr/share/"
        find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 {} +
        find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 {} +
        find "${pkgdir}/usr/share/icons" -name '*.png' -o -name '*.svg' | while read -r icon; do
            dir=$(dirname "$icon")
            base=$(basename "$icon")
            ext="${base##*.}"
            name="${base%.*}"
            [ "$name" = "buzz" ] && continue
            mv "$icon" "${dir}/buzz.${ext}"
        done
    fi
    # Install root-level icons to pixmaps (first matching png or svg)
    for f in *.png *.svg; do
        [ -f "$f" ] || continue
        ext="${f##*.}"
        install -Dm644 "$f" "${pkgdir}/usr/share/pixmaps/buzz.${ext}"
        break
    done
}