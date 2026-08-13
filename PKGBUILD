# Maintainer: Rasmus Karlsson <rasmus.karlsson@pajlada.com>
#
# Based on https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html

pkgname=jagex-launcher
pkgver=0.1.4
pkgrel=1
pkgdesc='Jagex Launcher for Linux'
arch=('x86_64')
url="https://osrs.runescape.com/download"
# TODO: Figure out proper license
# electron & chromium licenses are included, but no package license
license=('LicenseRef-Jagex-EULA')
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
provides=('jagex-launcher')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source=("${_appimage}::https://rs-launcher-updates.runescape.com/production/linux/x64/releases/$pkgver/jagex-launcher-beta-linux-x86_64.AppImage"
        "JAGEX-EULA")
sha256sums=('770db4cbc41d4bc3a7832882f6c607b459b6a3e969b46e7bfdbefcae9b31b43d'
            '9feba555717fe2e04335146cace192f48760e46670f4fa8248732fc4ea07e6fd')

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
    install -Dm644 "${srcdir}/JAGEX-EULA" "${pkgdir}/opt/${pkgname}/LICENSE"

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
    ln -s "/opt/$pkgname/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/$pkgname"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
