# Maintainer: czyt <czytcn@gmail.com>
pkgname=revpdf-bin
pkgver=5.0.0
pkgrel=2
pkgdesc="The Best Free Offline PDF Editor"
arch=('x86_64' 'aarch64')
url="https://github.com/Pawandeep-prog/revpdf-release"
license=('LicenseRef-Proprietary')
depends=('gtk3' 'libepoxy' 'fontconfig')
provides=('revpdf')
conflicts=('revpdf')
options=('!strip' '!debug')

source=("revpdf-${pkgver}-LICENSE::https://raw.githubusercontent.com/Pawandeep-prog/revpdf-release/v${pkgver}/LICENSE")
source_x86_64=("revpdf_editor-${pkgver}-x86_64.AppImage::https://github.com/Pawandeep-prog/revpdf-release/releases/download/v${pkgver}/revpdf_editor-x86_64.AppImage")
source_aarch64=("revpdf_editor-${pkgver}-aarch64.AppImage::https://github.com/Pawandeep-prog/revpdf-release/releases/download/v${pkgver}/revpdf_editor-aarch64.AppImage")
sha256sums=('bd1c79a65b067b364e41f02dffaa7822730008587e8655974590d4cd5202b986')
sha256sums_x86_64=('4b275817ed6a4983437bfcb0a7d8a2d25d2903143d2d327960b64589d1c5ae06')
sha256sums_aarch64=('50ec22e67fc4f7c01bc7e6a59846fa8c3db06116c45904ff5b5edba685030dd8')
noextract=(
    "revpdf_editor-${pkgver}-x86_64.AppImage"
    "revpdf_editor-${pkgver}-aarch64.AppImage"
)

package() {
    local _appimage="revpdf_editor-${pkgver}-${CARCH}.AppImage"

    # Unpack the AppImage at build time: its bundled runtime needs a working
    # FUSE mount (plus fuse2) just to start, which is not guaranteed on Arch.
    chmod +x "${srcdir}/${_appimage}"
    cd "${srcdir}"
    rm -rf squashfs-root
    "${srcdir}/${_appimage}" --appimage-extract >/dev/null

    install -dm755 "${pkgdir}/opt/revpdf"
    cp -a squashfs-root/. "${pkgdir}/opt/revpdf/"
    # Icons live in the hicolor tree below; the AppDir copy is unused.
    rm -rf "${pkgdir}/opt/revpdf/usr"

    local _size
    for _size in 16 24 32 48 64 128 256 512; do
        install -Dm644 "squashfs-root/usr/share/icons/hicolor/${_size}x${_size}/apps/com.revpdf.editor.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/com.revpdf.editor.png"
    done

    install -Dm644 squashfs-root/com.revpdf.editor.desktop \
        "${pkgdir}/usr/share/applications/com.revpdf.editor.desktop"
    sed -i 's|^Exec=.*|Exec=revpdf %f|' \
        "${pkgdir}/usr/share/applications/com.revpdf.editor.desktop"

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/revpdf" <<'EOF'
#!/bin/sh
exec /opt/revpdf/AppRun "$@"
EOF

    install -Dm644 "${srcdir}/revpdf-${pkgver}-LICENSE" \
        "${pkgdir}/usr/share/licenses/revpdf-bin/LICENSE"
}
