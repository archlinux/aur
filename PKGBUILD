# Maintainer: ibrahemid <ibrahemid@gmail.com>
pkgname=writ-bin
_pkgname=writ
pkgver=0.3.2
pkgrel=1
pkgdesc="Lightweight, always-ready text editor for developers"
arch=('x86_64')
url="https://github.com/ibrahemid/writ"
license=('MIT')
depends=('glibc' 'fuse2' 'gtk3' 'webkit2gtk-4.1')
optdepends=('appimagelauncher: desktop integration for AppImages')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
source=("${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Writ_${pkgver}_amd64.AppImage"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
noextract=("${_pkgname}-${pkgver}.AppImage")
sha256sums=('07682f522eb11a1a1d31c2350b7eff5e6c1a07737bd0f6d3d576672328e0bb09'
            'SKIP')

prepare() {
    chmod +x "${srcdir}/${_pkgname}-${pkgver}.AppImage"
    "${srcdir}/${_pkgname}-${pkgver}.AppImage" --appimage-extract >/dev/null
}

package() {
    local root="${srcdir}/squashfs-root"

    install -dm755 "${pkgdir}/opt/${_pkgname}/"
    cp -r "${root}/"* "${pkgdir}/opt/${_pkgname}/"
    chmod -R u+rwX,go+rX,go-w "${pkgdir}/opt/${_pkgname}"

    # /usr/bin/writ is the CLI from the payload, not the GUI launcher, so
    # `writ file.rs` and `... | writ` behave as documented. The CLI launches the
    # app through AppRun rather than usr/bin/writ-tauri directly, because AppRun
    # sources the bundled GTK hook the payload's libraries expect.
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${_pkgname}" <<EOF
#!/bin/sh
: "\${WRIT_GUI_BIN:=/opt/${_pkgname}/AppRun}"
export WRIT_GUI_BIN
exec "/opt/${_pkgname}/usr/bin/${_pkgname}" "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${_pkgname}"

    # Tauri names the bundled entry and icons after the product and the main
    # binary: Writ.desktop and writ-tauri.png. Both are renamed to writ here so
    # the desktop entry, the icon it points at, and /usr/bin/writ agree.
    install -Dm644 "${root}/usr/share/applications/Writ.desktop" \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    sed -i -e "s|^Exec=.*|Exec=/opt/${_pkgname}/AppRun %U|" \
        -e "s|^Icon=.*|Icon=${_pkgname}|" \
        -e "s|^StartupWMClass=.*|StartupWMClass=writ-tauri|" \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    local icon rel
    while IFS= read -r -d '' icon; do
        rel="${icon#${root}/usr/share/icons/}"
        install -Dm644 "${icon}" \
            "${pkgdir}/usr/share/icons/${rel%/*}/${_pkgname}.png"
    done < <(find "${root}/usr/share/icons" -name 'writ-tauri.png' -print0)

    install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
