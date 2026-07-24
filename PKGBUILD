# Maintainer: ibrahemid <ibrahemid@gmail.com>
pkgname=writ-bin
_pkgname=writ
pkgver=0.2.0
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
sha256sums=('cbc02a0929aa5bb2c934b82b1aa633b3b7c2ae83968453d46772605155608911'
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

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/AppRun" "${pkgdir}/usr/bin/${_pkgname}"

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
