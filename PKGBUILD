# Maintainer: rbagpksr <rbagpksr@mailer.me>

_pkgname=anythingllm

pkgname="${_pkgname}"-appimage
pkgver=1.4.4
pkgrel=1
pkgdesc="Any LLM, unlimited documents, and fully private. All on your desktop."
arch=('x86_64')
url="https://useanything.com/"
license=('custom')
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
options=(!strip !debug)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://s3.us-west-1.amazonaws.com/public.useanything.com/legacy/${pkgver}/AnythingLLMDesktop.AppImage")
noextract=("${_appimage}")
sha256sums_x86_64=('e4b0cedf156928a8c2aa706fbac0a06ee890b5b5d80b62262455e308c5151730')
appname="anythingllm-desktop"

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${appname}|"\
        "squashfs-root/${appname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/LICENSE.electron.txt" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${appname}.desktop"\
            "${pkgdir}/usr/share/applications/${appname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${appname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
