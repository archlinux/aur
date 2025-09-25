# Maintainer: ArtFox3 <artfox3@gmail.com>

_pkgname=appium-inspector

pkgname="${_pkgname}"-appimage
pkgver="2025.8.2"
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
    "${_appimage}::https://github.com/appium/appium-inspector/releases/download/v${pkgver}/Appium-Inspector-${pkgver}-linux-x86_64.AppImage"
    "https://raw.githubusercontent.com/appium/appium-inspector/v${pkgver}/LICENSE"
)

noextract=("${_appimage}")
sha256sums_x86_64=('240c0888907ce05104635f326f19d659130914b0abb8dff4a0d764dabcdf9b59'
                   '5cb791a45cafc4bdaef57f3ba49fb7691a98c756e8148467f9e241295728490f')

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
