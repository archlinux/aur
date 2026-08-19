# Maintainer: iamzhz <iamzhz at foxmail dot com>
_pkgname=dev-sidecar
pkgname="${_pkgname}-appimage"
pkgver=2.2.0
pkgrel=1
pkgdesc="开发者边车，github打不开，github加速，git clone加速，git release下载加速，stackoverflow加速"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/docmirror/dev-sidecar"
conflicts=('dev-sidecar' 'dev-sidecar-git' 'dev-sidecar-bin')
license=('MPL-2.0')
depends=('fuse2' 'hicolor-icon-theme')
makedepends=('fuse2')
options=(!strip)

source_x86_64=("DevSidecar-${pkgver}-x86_64.AppImage::https://github.com/docmirror/dev-sidecar/releases/download/v${pkgver}/DevSidecar-${pkgver}-linux-x86_64.AppImage")
source_aarch64=("DevSidecar-${pkgver}-aarch64.AppImage::https://github.com/docmirror/dev-sidecar/releases/download/v${pkgver}/DevSidecar-${pkgver}-linux-arm64.AppImage")
source_armv7h=("DevSidecar-${pkgver}-armv7h.AppImage::https://github.com/docmirror/dev-sidecar/releases/download/v${pkgver}/DevSidecar-${pkgver}-linux-armv7l.AppImage")

sha256sums_x86_64=('c4a38b47d689cc42805ebf7e4a4ec15fbc45b5467e8a217b2428ba15c57d5b4d')
sha256sums_aarch64=('4c1e3f4d5b19c2f3bcb88bf1ce4955cfbe2a6c9431e3088b070b628a91c2e153')
sha256sums_armv7h=('8c6f605ed4d401ddad32cbdf7f629258666694b326aa7cf4d9d299c0324dec86')

_appimage="DevSidecar-${pkgver}-${CARCH}.AppImage"
noextract=("${_appimage}")

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" \
        "squashfs-root/@docmirrordev-sidecar-gui.desktop"
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    install -Dm644 "${srcdir}/squashfs-root/@docmirrordev-sidecar-gui.desktop" \
        "${pkgdir}/usr/share/applications/@docmirrordev-sidecar-gui.desktop"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/" 2>/dev/null || true

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
