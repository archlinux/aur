# Maintainer: iamzhz <iamzhz at foxmail dot com>
_pkgname=dev-sidecar
pkgname="${_pkgname}-appimage"
pkgver=2.3.3
pkgrel=1
pkgdesc="开发者边车，github打不开，github加速，git clone加速，git release下载加速，stackoverflow加速"
arch=('x86_64')
url="https://github.com/docmirror/dev-sidecar"
conflicts=('dev-sidecar' 'dev-sidecar-git' 'dev-sidecar-bin')
license=('MPL-2.0')
depends=('fuse2' 'hicolor-icon-theme')
makedepends=('fuse2')
options=(!strip)

source_x86_64=("DevSidecar-${pkgver}-linux-x86_64.AppImage::https://github.com/docmirror/dev-sidecar/releases/download/v${pkgver}/DevSidecar-${pkgver}-linux-x86_64.AppImage")

sha256sums_x86_64=('4a05c8b83eac8330b2e89fde8aec77b44eb758ea0059acba82e6d84731e99afe')

_appimage="DevSidecar-${pkgver}-linux-${CARCH}.AppImage"
noextract=("${_appimage}")

_appid="docmirror-dev-sidecar-gui"

prepare() {
    rm -rf squashfs-root
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    sed -i -E \
        -e "s|^Exec=.*|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname} --no-sandbox %U|" \
        -e "s|^StartupWMClass=.*|StartupWMClass=${_appid}|" \
        "squashfs-root/dev-sidecar-gui.desktop"
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    install -Dm644 "${srcdir}/squashfs-root/dev-sidecar-gui.desktop" \
        "${pkgdir}/usr/share/applications/${_appid}.desktop"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}

