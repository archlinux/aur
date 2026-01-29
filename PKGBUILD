# Maintainer: Claude <noreply@anthropic.com>
# Packaging Repo: https://github.com/orange-guo/aur-packages

pkgname=fingerprint-chromium-bin
_pkgname=fingerprint-chromium
pkgver=142.0.7444.175
pkgrel=1
_upstream_build=1
pkgdesc="Fingerprint Chromium (Ungoogled Chromium with fingerprinting protection)"
arch=('x86_64')
url="https://github.com/adryfish/fingerprint-chromium"
license=('BSD')
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'ttf-liberation')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

_repouser="adryfish"
_reponame="fingerprint-chromium"

# Source with renamed AppImage
source=("${_pkgname}-${pkgver}.AppImage::https://github.com/${_repouser}/${_reponame}/releases/download/${pkgver}/ungoogled-chromium-${pkgver}-${_upstream_build}-x86_64.AppImage")
sha256sums=('aba66873fb5aa9528b12903f45e220db632447021e6b315ba678ea6821fcf154')

options=('!strip')

prepare() {
    chmod +x "${_pkgname}-${pkgver}.AppImage"
    ./"${_pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
    # Install to /opt
    install -d "${pkgdir}/opt/${_pkgname}"
    cp -r squashfs-root/* "${pkgdir}/opt/${_pkgname}/"

    # Fix permissions
    chmod -R a+rX "${pkgdir}/opt/${_pkgname}"

    # Link binary
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/AppRun" "${pkgdir}/usr/bin/${_pkgname}"

    # Install desktop file and icon
    if [ -f "squashfs-root/ungoogled-chromium.desktop" ]; then
        install -Dm644 "squashfs-root/ungoogled-chromium.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
        sed -i "s|Exec=AppRun|Exec=/usr/bin/${_pkgname}|g" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
        sed -i "s|Name=Ungoogled Chromium|Name=Fingerprint Chromium|g" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    elif [ -f "squashfs-root/${_pkgname}.desktop" ]; then
        install -Dm644 "squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
        sed -i "s|Exec=AppRun|Exec=/usr/bin/${_pkgname}|g" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    fi

    # Install icon if available
    if [ -f "squashfs-root/product_logo_256.png" ]; then
        install -Dm644 "squashfs-root/product_logo_256.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
        # Update Icon path in desktop file
        sed -i "s|Icon=.*|Icon=${_pkgname}|g" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    fi
}
