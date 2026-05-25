pkgname=terax-ai-bin
pkgver=0.7.3
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
source=("${_appimage}::https://github.com/crynta/terax-ai/releases/download/v0.7.3/Terax_0.7.3_amd64.AppImage")
sha256sums=('cba61a8dad11863d1631a9d74b0215d2b497b9a08ffc56e85ffc5f276bf6cbe2')
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
        cp -r usr/share/icons "${pkgdir}/usr/share/"
        find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 {} +
        find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 {} +
        find "${pkgdir}/usr/share/icons" -name '*.png' -o -name '*.svg' | while read -r icon; do
            dir=$(dirname "$icon")
            base=$(basename "$icon")
            ext="${base##*.}"
            name="${base%.*}"
            [ "$name" = "terax" ] && continue
            mv "$icon" "${dir}/terax.${ext}"
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