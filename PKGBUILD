pkgname=pane-bin
pkgver=2.0.9
pkgrel=1
pkgdesc="Terminal-native AI agent manager — any provider, one unified interface"
arch=(x86_64 aarch64)
url="https://github.com/dcouple/Pane"
license=(AGPL-3.0)

depends=("fuse2")
options=(!strip !debug)
conflicts=("pane")
provides=(pane)

_appimage="Pane-${pkgver}-linux-${arch}.AppImage"
source=("${_appimage}::https://github.com/dcouple/Pane/releases/download/v2.0.9/Pane-2.0.9-linux-x86_64.AppImage")
sha256sums=('757518489a4ac6d74d8dfdfd6904699569299575d84b527318e3453f6a326a47')
noextract=("${_appimage}")

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

package() {
    install -Dm755 "${srcdir}/${_appimage}" \
        "${pkgdir}/opt/${pkgname}/${_appimage}"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/pane"

    # Install extra files from srcdir (e.g., LICENSE alongside AppImage)

    cd "${srcdir}/squashfs-root"
    find . -maxdepth 1 -name '*.desktop' -exec \
        install -Dm644 {} "${pkgdir}/usr/share/applications/pane.desktop" \;

    sed -i "s|Exec=.*|Exec=pane %U|" \
        "${pkgdir}/usr/share/applications/pane.desktop"
    sed -i "s|Icon=.*|Icon=pane|" \
        "${pkgdir}/usr/share/applications/pane.desktop"
    if [ -d usr/share/icons ]; then
        cp -r usr/share/icons "${pkgdir}/usr/share/"
        find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 {} +
        find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 {} +
        find "${pkgdir}/usr/share/icons" -name '*.png' -o -name '*.svg' | while read -r icon; do
            dir=$(dirname "$icon")
            base=$(basename "$icon")
            ext="${base##*.}"
            name="${base%.*}"
            [ "$name" = "pane" ] && continue
            mv "$icon" "${dir}/pane.${ext}"
        done
    fi
    # Install root-level icons to pixmaps (first matching png or svg)
    for f in *.png *.svg; do
        [ -f "$f" ] || continue
        ext="${f##*.}"
        install -Dm644 "$f" "${pkgdir}/usr/share/pixmaps/pane.${ext}"
        break
    done
}