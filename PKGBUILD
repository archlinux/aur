# Maintainer: Andy Alt <arch_stanton5995 at proton.me>

_pkgbinname=netpanzer
pkgname=netpanzer-appimage
_pkgformalname=NetPanzer
pkgver=0.9.0
pkgrel=1
pkgdesc="An online multiplayer tactical warfare game designed for fast action combat (AppImage)"
url="https://github.com/netpanzer/netpanzer"
license=('GPL-2.0-or-later')
arch=('x86_64' 'aarch64')
depends=('fuse2' 'zlib' 'hicolor-icon-theme')
provides=("${pkgname%-appimage}")
conflicts=("${pkgname%-appimage}")
options=('!strip' '!debug')
source_x86_64=("${pkgname}-${pkgver}-x86_64.AppImage::https://github.com/${_pkgbinname}/${_pkgbinname}/releases/download/v${pkgver}/${_pkgformalname}-${pkgver}-linux-x86_64.AppImage")
sha256sums_x86_64=('26576a7a780cf49a62676202e3ba2cc0358a080420e0539399e9ef4b938b8998')
source_aarch64=("${pkgname}-${pkgver}-aarch64.AppImage::https://github.com/${_pkgbinname}/${_pkgbinname}/releases/download/v${pkgver}/${_pkgformalname}-${pkgver}-linux-aarch64.AppImage")
sha256sums_aarch64=('a9a0308ebbb3fa79cdd1876f8a23e665df0d3661dabee846bd16bd64afe42cb7')
noextract=("${pkgname}-${pkgver}-x86_64.AppImage" "${pkgname}-${pkgver}-aarch64.AppImage")

prepare() {
    local _appimage="${pkgname}-${pkgver}-${CARCH}.AppImage"
    chmod a+x "${_appimage}"
    "./${_appimage}" --appimage-extract > /dev/null
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=${_pkgbinname}|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgbinname}|" \
        "squashfs-root/${_pkgbinname}.desktop"
    sed -i '/^X-AppImage-/d' "squashfs-root/${_pkgbinname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    local _appimage="${pkgname}-${pkgver}-${CARCH}.AppImage"

    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgbinname}"

    # Icon
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/48x48/apps/${_pkgbinname}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/48x48/apps"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgbinname}.desktop" \
        -t "${pkgdir}/usr/share/applications"
}
