pkgname=pane-bin
pkgver=2.1.0
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
source=("${_appimage}::https://github.com/dcouple/Pane/releases/download/v2.1.0/Pane-2.1.0-linux-x86_64.AppImage")
sha256sums=('463d463cb229ec15e13d3baef3ea6f8665c32461ce239cf84cf8567419aa8fb0')
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