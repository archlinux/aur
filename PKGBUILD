# Maintainer: VBen <devel@velmeden.info>
pkgname=loxone-app-bin
pkgver=17.1.2.17593
pkgrel=1
pkgdesc="Loxone Smart Home Control App"
arch=('x86_64' 'aarch64')
url="https://www.loxone.com"
license=('custom')
depends=('fuse2')
options=('!strip')

# Upstream filename = major(2) + minor(1) + patch(1) + build(5) digits, no dots
_buildnum=171116704

source_x86_64=("${pkgname}-${pkgver}-x86_64.AppImage::https://updatefiles.loxone.com/linux/Release/${_buildnum}-x86_64.AppImage")
source_aarch64=("${pkgname}-${pkgver}-aarch64.AppImage::https://updatefiles.loxone.com/linux/Release/${_buildnum}-arm64.AppImage")
sha256sums_x86_64=('e1efed8cae15c7fcd64d9112a921985b0d2aebed13dcba24f526855d532c7457')
sha256sums_aarch64=('dd37591f8b22e56fc0fb2b80e73d251e83253c58df2d26aac217f2e8475ef6c0')

prepare() {
    if [ "$CARCH" = "x86_64" ]; then
        _appimage="${pkgname}-${pkgver}-x86_64.AppImage"
    else
        _appimage="${pkgname}-${pkgver}-aarch64.AppImage"
    fi

    chmod +x "$_appimage"
    ./"$_appimage" --appimage-extract
    mv squashfs-root "${pkgname}-squashfs"
}

package() {
    if [ "$CARCH" = "x86_64" ]; then
        _appimage="${pkgname}-${pkgver}-x86_64.AppImage"
    else
        _appimage="${pkgname}-${pkgver}-aarch64.AppImage"
    fi

    # Install AppImage to /opt
    install -Dm755 "$_appimage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Launcher wrapper in PATH
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" << 'WRAPPER'
#!/bin/sh
exec /opt/loxone-app-bin/loxone-app-bin.AppImage "$@"
WRAPPER

    # Desktop entry — patch from embedded file if available
    _desktop=$(find "${pkgname}-squashfs" -maxdepth 2 -name "*.desktop" | head -1)
    if [ -n "$_desktop" ]; then
        sed -i "s|^Exec=.*|Exec=/usr/bin/${pkgname}|" "$_desktop"
        sed -i "s|^Icon=.*|Icon=${pkgname}|" "$_desktop"
        install -Dm644 "$_desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    else
        install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" << EOF
[Desktop Entry]
Name=Loxone
Comment=${pkgdesc}
Exec=/usr/bin/${pkgname} %U
Icon=${pkgname}
Type=Application
Categories=Network;
StartupNotify=true
EOF
    fi

    # Icons from hicolor tree inside the extracted AppImage
    while IFS= read -r -d '' _icon; do
        _size=$(basename "$(dirname "$(dirname "$_icon")")")
        install -Dm644 "$_icon" \
            "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
    done < <(find "${pkgname}-squashfs/usr/share/icons/hicolor" \
                  -name "*.png" -print0 2>/dev/null)

    # Fallback: root-level .png (AppImage standard location)
    if [ ! -d "${pkgdir}/usr/share/icons" ]; then
        _icon=$(find "${pkgname}-squashfs" -maxdepth 1 -name "*.png" | head -1)
        [ -n "$_icon" ] && install -Dm644 "$_icon" \
            "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    fi

    # License
    _license=$(find "${pkgname}-squashfs" -iname "license*" | head -1)
    [ -n "$_license" ] && install -Dm644 "$_license" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
