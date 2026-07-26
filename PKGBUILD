# Maintainer: Rasmus Karlsson <rasmus.karlsson@pajlada.com>
#
# Based on https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html

pkgname=jagex-launcher
pkgver=0.1.1
pkgrel=2
pkgdesc='Jagex Launcher for Linux'
arch=('x86_64')
url="https://osrs.runescape.com/download"
# TODO: Figure out proper license
# electron & chromium licenses are included, but no package license
license=('custom:Unlicense')
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
provides=('jagex-launcher')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source=("${_appimage}::https://rs-launcher-updates.runescape.com/production/linux/x64/releases/$pkgver/jagex-launcher-beta-linux-x86_64.AppImage")
sha256sums=('55459fc70be75538dfb00f255d81811ba4982900dbce1650aab800a62cfb9481')

prepare() {
  chmod +x "${_appimage}"
  "./${_appimage}" --appimage-extract >/dev/null
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${pkgname}|"\
        "squashfs-root/${pkgname}.desktop"

    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/LICENSE.electron.txt" "${pkgdir}/opt/${pkgname}/LICENSE.electron.txt"
    install -Dm644 "${srcdir}/squashfs-root/LICENSES.chromium.html" "${pkgdir}/opt/${pkgname}/LICENSES.chromium.html"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/$pkgname/LICENSE.electron.txt" "$pkgdir/usr/share/licenses/$pkgname"
    ln -s "/opt/$pkgname/LICENSEs.chromium.html" "$pkgdir/usr/share/licenses/$pkgname"
}
