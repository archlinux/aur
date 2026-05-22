# Maintainer: OneZ3r0 <onez3r0@outlook.com>
pkgname=yakit-bin
pkgver=1.4.7_0522
pkgrel=1
pkgdesc="Cyber Security ALL-IN-ONE Platform (official AppImage release)"
arch=('x86_64')
url="https://github.com/yaklang/yakit"
license=('AGPL-3.0-only')
depends=('sh' 'glibc' 'fuse2' 'hicolor-icon-theme' 'zlib')
provides=('yakit')
conflicts=('yakit' 'yakit-appimage')
options=('!strip')

_upstream_ver="${pkgver//_/-}"
_appimage="Yakit-${_upstream_ver}-linux-amd64.AppImage"

source=(
  "${_appimage}::https://github.com/yaklang/yakit/releases/download/v${_upstream_ver}/${_appimage}"
)
noextract=("${_appimage}")
sha256sums=('e66638d51a7afea202a311233d1a392a2ea8dd51e646ea909ca6bd411066e659')

prepare() {
    chmod +x "${srcdir}/${_appimage}"
    rm -rf "${srcdir}/squashfs-root"
    "${srcdir}/${_appimage}" --appimage-extract >/dev/null

    sed 's|^Exec=.*|Exec=/usr/bin/yakit %U|' \
        "${srcdir}/squashfs-root/yakit.desktop" \
        > "${srcdir}/yakit.desktop"
}

package() {
    install -Dm755 "${srcdir}/${_appimage}" \
        "${pkgdir}/opt/${pkgname}/Yakit.AppImage"

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/yakit" <<'EOF'
#!/bin/sh
exec /opt/yakit-bin/Yakit.AppImage --no-sandbox "$@"
EOF

    install -Dm644 "${srcdir}/yakit.desktop" \
        "${pkgdir}/usr/share/applications/yakit.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/yakit.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/yakit.png"
    install -Dm644 "${srcdir}/squashfs-root/LICENSE.md" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
