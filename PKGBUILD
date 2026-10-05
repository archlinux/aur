# Maintainer: Ante Laurijssen <antelaurijssen@gmail.com>

pkgname=wfweb-appimage
_appname=wfweb
pkgver=0.9.2
pkgrel=1
pkgdesc='Headless wfview fork: control Icom transceivers from a web browser (AppImage release)'
arch=('x86_64' 'aarch64')
url='https://github.com/adecarolis/wfweb'
license=('GPL-3.0-only')
depends=('fuse2' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'zlib')
provides=("${_appname}=${pkgver}")
conflicts=("${_appname}")
options=('!strip' '!debug')
noextract=("${_appname}_${pkgver}-${CARCH}.AppImage")
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/adecarolis/${_appname}/v${pkgver}/LICENSE")
source_x86_64=("${_appname}_${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/${_appname}_${pkgver}-x86_64.AppImage")
source_aarch64=("${_appname}_${pkgver}-aarch64.AppImage::${url}/releases/download/v${pkgver}/${_appname}_${pkgver}-aarch64.AppImage")

prepare() {
    local _appimage="${_appname}_${pkgver}-${CARCH}.AppImage"
    chmod +x "${_appimage}"
    # Pull only the desktop entry and icon out of the AppImage
    "./${_appimage}" --appimage-extract 'usr/share/applications/wfweb.desktop' >/dev/null
    "./${_appimage}" --appimage-extract 'usr/share/icons/hicolor/scalable/apps/wfweb.svg' >/dev/null
    sed -i 's|^Exec=.*|Exec=/usr/bin/wfweb|' squashfs-root/usr/share/applications/wfweb.desktop
}

package() {
    install -Dm755 "${_appname}_${pkgver}-${CARCH}.AppImage" "${pkgdir}/opt/${pkgname}/${_appname}.AppImage"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_appname}.AppImage" "${pkgdir}/usr/bin/${_appname}"

    install -Dm644 squashfs-root/usr/share/applications/wfweb.desktop \
        "${pkgdir}/usr/share/applications/${_appname}.desktop"
    install -Dm644 squashfs-root/usr/share/icons/hicolor/scalable/apps/wfweb.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_appname}.svg"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
sha256sums=('8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903')
sha256sums_x86_64=('0e307021a8c3475626db1fc94b188ff46efe4ad9fe3f3243a8b0b75f6a6ce411')
sha256sums_aarch64=('027e9e0995b96bf9e2e8b9e7c513aa95098cbca6bb73a0f74fe0a1ee03d9db42')
