# Maintainer: ArtFox3 <artfox3@gmail.com>

_pkgname=appium-inspector

pkgname="${_pkgname}"-appimage
pkgver="2024.12.1"
pkgrel=1
pkgdesc="A GUI inspector for mobile apps and more, powered by a (separately installed) Appium server."
arch=('x86_64')
url="https://github.com/appium/appium-inspector/"
license=('Apache Version 2.0')
depends=('zlib' 'hicolor-icon-theme')
makedepends=('grep' 'curl' 'coreutils')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"

# install script for post install changes
#install=$pkgname.install

source_x86_64=(
    "${_appimage}::https://github.com/appium/appium-inspector/releases/download/v2024.12.1/Appium-Inspector-2024.12.1-linux-x86_64.AppImage"
    "https://raw.githubusercontent.com/appium/appium-inspector/v${pkgver}/LICENSE"
)

noextract=("${_appimage}")
sha256sums_x86_64=('b1fe6261495a2e9cfa7dad25b4ba7ab9e756a71cf0310bc7d10b97b5d1f561e8'
                   'afc4a40f552d48dd41e24d6e247a15a0712b69fc740811cb36a99e9bd98dff61')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun --no-sandbox %U|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" \
        "squashfs-root/${_pkgname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
