pkgname=multica-desktop-bin
pkgver=0.3.20
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
source=("${_appimage}::https://github.com/multica-ai/multica/releases/download/v0.3.20/multica-desktop-0.3.20-linux-x86_64.AppImage")
sha256sums=('0fc9454d397fc70a15fbf3d4f344265edd31641e74d5f2c8e9011ea50cc38eda')
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
        cp -r usr/share/icons "${pkgdir}/usr/share/"
        find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 {} +
        find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 {} +
        find "${pkgdir}/usr/share/icons" -name '*.png' -o -name '*.svg' | while read -r icon; do
            dir=$(dirname "$icon")
            base=$(basename "$icon")
            ext="${base##*.}"
            name="${base%.*}"
            [ "$name" = "multica-desktop" ] && continue
            mv "$icon" "${dir}/multica-desktop.${ext}"
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