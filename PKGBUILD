# Maintainer: delta-whiplash <delta@delta-net.ovh>

pkgname=pake-lizhi
_appname=LiZhi
pkgver=3.10.0
pkgrel=1
pkgdesc="LiZhi FM wrapped as an AppImage using Pake"
arch=('x86_64')
url="https://github.com/tw93/Pake"
license=('MIT')
depends=('fuse2')
provides=('pake-lizhi')
conflicts=('pake-lizhi')
options=('!strip')

source=("${_appname}.AppImage::https://github.com/tw93/Pake/releases/download/V${pkgver}/${_appname}_x86_64.AppImage")
sha256sums=('SKIP')

prepare() {
    chmod +x "${_appname}.AppImage"
    "./${_appname}.AppImage" --appimage-extract
}

package() {
    install -Dm755 "${_appname}.AppImage" \
        "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" <<'EOF'
#!/bin/sh
exec /opt/pake-lizhi/pake-lizhi.AppImage "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    local _desktop
    _desktop=$(find "${srcdir}/squashfs-root" -maxdepth 1 -name "*.desktop" | head -n1)

    if [[ -f "$_desktop" ]]; then
        sed -i "s|^Exec=.*|Exec=/usr/bin/${pkgname} %U|" "$_desktop"
        install -Dm644 "$_desktop" \
            "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    else
        cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Name=LiZhi (Pake)
Exec=/usr/bin/${pkgname} %U
Type=Application
Icon=${pkgname}
Comment=LiZhi FM wrapped as an AppImage using Pake
Categories=AudioVideo;Audio;
Terminal=false
EOF
    fi

    find "${srcdir}/squashfs-root/usr/share/icons" -name "*.png" 2>/dev/null | \
    while read -r icon; do
        local rel="${icon#${srcdir}/squashfs-root/usr/share/icons/}"
        install -Dm644 "$icon" "${pkgdir}/usr/share/icons/${rel}"
    done

    local _icon
    _icon=$(find "${srcdir}/squashfs-root" -maxdepth 1 -name "*.png" | head -n1)
    if [[ -f "$_icon" ]]; then
        install -Dm644 "$_icon" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    fi

    local _license
    _license=$(find "${srcdir}/squashfs-root" -maxdepth 2 -name "LICENSE*" | head -n1)
    [[ -n "$_license" ]] && install -Dm644 "$_license" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
