# Maintainer: crosant <crosant@crosant.de>

_pkgname=archon-lite
pkgname=${_pkgname}-bin
pkgver=9.5.0
pkgrel=2
pkgdesc="Archon Lite Uploader - pre-built binary AppImage"
arch=('x86_64')
url="https://github.com/RPGLogs/Uploaders-archon-lite"
license=('custom')
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
provides=('archon-lite')
conflicts=('archon-lite-appimage')
options=(!strip)
_appimage="${_pkgname}-v${pkgver}.AppImage"
source_x86_64=("${_appimage}::${url}/releases/download/v${pkgver}/${_appimage}"
               "${_pkgname}.desktop")
noextract=("${_appimage}")
sha256sums_x86_64=('66e00b815b6ab18b6f9d2abc86424be00fa2e14684a64fb62f76e94845eb8513'
                    '19e8f7d78d5f621fd9a0aab1ebed74015a63beb797d8d942362e32be479077c0')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Executable launcher wrapper (bypassing sandbox issues if applicable)
    printf '#!/bin/sh\nexec /opt/%s/%s.AppImage --no-sandbox "$@"\n' \
      "${pkgname}" "${pkgname}" \
      > "${srcdir}/${_pkgname}"
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    # Icons: locate icon dynamically in squashfs-root
    local icon_src=""
    if [ -f "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/archon-lite.png" ]; then
        icon_src="${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/archon-lite.png"
    elif [ -f "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/Archon App Lite.png" ]; then
        icon_src="${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/Archon App Lite.png"
    else
        icon_src=$(find "${srcdir}/squashfs-root/usr/share/icons" -name "*.png" 2>/dev/null | head -n 1)
    fi
    if [ -z "$icon_src" ]; then
        icon_src=$(find "${srcdir}/squashfs-root" -name "*.png" 2>/dev/null | head -n 1)
    fi

    if [ -n "$icon_src" ]; then
        install -Dm644 "$icon_src" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/archon-lite.png"
    else
        echo "ERROR: Could not find icon PNG in squashfs-root" >&2
        return 1
    fi

    # Desktop file
    install -Dm644 "${srcdir}/${_pkgname}.desktop" \
      "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    sed -i \
      -e "s|^Exec=.*|Exec=/usr/bin/${_pkgname} %%U|" \
      -e "s|^Icon=.*|Icon=${_pkgname}|" \
      "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # License files
    install -Dm644 \
      "${srcdir}/squashfs-root/LICENSE.electron.txt" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
    install -Dm644 \
      "${srcdir}/squashfs-root/LICENSES.chromium.html" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
