# Maintainer: delta-whiplash <delta@delta-net.ovh>

# -------------------------------------------------------------------
# Naming convention:
#   pkgname  = openwhispr-appimage  (AUR / pacman convention: lowercase)
#   _appname = OpenWhispr           (upstream asset naming: PascalCase)
#   Asset:   OpenWhispr-${pkgver}-linux-x86_64.AppImage
# -------------------------------------------------------------------
pkgname=openwhispr-appimage
_appname=OpenWhispr
pkgver=1.6.6
pkgrel=1
pkgdesc="Voice-to-text dictation app with local Whisper/Parakeet and cloud models (AppImage)"
arch=('x86_64')
url="https://github.com/${_appname}/${pkgname%-appimage}"
license=('MIT')
depends=('fuse2')
provides=('openwhispr')
conflicts=('openwhispr')
options=('!strip')

# AppImage asset URL — the only source needed
source=("${_appname}-${pkgver}-linux-x86_64.AppImage::https://github.com/${_appname}/openwhispr/releases/download/v${pkgver}/${_appname}-${pkgver}-linux-x86_64.AppImage")
sha256sums=('fc88ad54f8fcba3deddb696a3119a59ac9ae30c0dbf527d11462aa8561b6cce4')

prepare() {
    chmod +x "${_appname}-${pkgver}-linux-x86_64.AppImage"

    # Extract the AppImage squashfs content without running it
    # --appimage-extract dumps to squashfs-root/ in $srcdir
    "./${_appname}-${pkgver}-linux-x86_64.AppImage" --appimage-extract
}

package() {
    # ---- AppImage binary ----------------------------------------
    install -Dm755 "${_appname}-${pkgver}-linux-x86_64.AppImage" \
        "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Wrapper script in PATH so the user can launch with `openwhispr`
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/openwhispr" <<'EOF'
#!/bin/sh
exec /opt/openwhispr-appimage/openwhispr-appimage.AppImage "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/openwhispr"

    # ---- .desktop file ------------------------------------------
    # Electron AppImages embed the .desktop at squashfs-root/<appname>.desktop
    local _desktop
    _desktop="${srcdir}/squashfs-root/open-whispr.desktop"

    if [[ -f "$_desktop" ]]; then
        # Fix the Exec path to use our wrapper
        sed -i "s|^Exec=.*|Exec=/usr/bin/openwhispr %U|" "$_desktop"
        install -Dm644 "$_desktop" \
            "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    fi

    # ---- Icon ---------------------------------------------------
    # Electron AppImages typically ship icons at:
    #   squashfs-root/usr/share/icons/hicolor/<size>/apps/<name>.png
    # or a single icon at squashfs-root/<name>.png
    find "${srcdir}/squashfs-root/usr/share/icons" -name "*.png" 2>/dev/null \
    | while read -r icon; do
        # Preserve the hicolor tree structure
        local rel="${icon#${srcdir}/squashfs-root/usr/share/icons/}"
        install -Dm644 "$icon" "${pkgdir}/usr/share/icons/${rel}"
    done

    # Fallback: top-level icon
    if [[ -f "${srcdir}/squashfs-root/${_appname,,}.png" ]]; then
        install -Dm644 "${srcdir}/squashfs-root/${_appname,,}.png" \
            "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    fi

    # ---- License ------------------------------------------------
    local _license
    _license=$(find "${srcdir}/squashfs-root" -maxdepth 2 -name "LICENSE*" | head -n1)
    [[ -n "$_license" ]] && install -Dm644 "$_license" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
