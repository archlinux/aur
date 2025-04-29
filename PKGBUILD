# Maintainer: David Birks <david@birks.dev>
# Contributor: pika02 <pikakolendo02 at gmail dot com>

_pkgname=anythingllm

pkgname="${_pkgname}"-appimage
pkgver=1.8.0
pkgrel=1
pkgdesc="AnythingLLM: The all-in-one AI app you were looking for. Any LLM, unlimited documents, and fully private. All on your desktop."
arch=('x86_64')
url="https://anythingllm.com/"
license=('custom')
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
options=(!strip !debug)
_appimage="AnythingLLMDesktop.AppImage"
source_x86_64=("${_appimage}::https://cdn.anythingllm.com/latest/AnythingLLMDesktop.AppImage")
noextract=("${_appimage}")
b2sums_x86_64=('4b52fa923dd6ab96dc668285407119f6c088070d11dc0f9385dd4fba425f9426d89ba086d74e1c92c6b2decc08e0c001cd6d1945285cfc2443a3cd75b3b99865')
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
