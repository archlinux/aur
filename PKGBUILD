# Maintainer: Tai Lam <taivlam-aur-mpr [dot] tinsmith796 [at] silomails [dot] com>
# Contributor: Kyle Phillips <kyle@pkyle.me>
# Based on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html

_pkgname=mudita-center
pkgname="${_pkgname}"-appimage
pkgver=3.2.1
pkgrel=1
pkgdesc="Mudita Center Electron App. Expand and update the features of Mudita Pure, while using your computer."
arch=('x86_64')
url="https://mudita.com/products/software-apps/mudita-center/"
_url="https://github.com/mudita/mudita-center"
license=('GPL-3.0-or-later')
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source=("${_appimage}::${_url}/releases/download/${pkgver}/Mudita-Center.AppImage")
noextract=("${_appimage}")
sha512sums=('fc73111353540d31e3922c7b45b1e2d6cda693890a09236659fa179f225d5e3189e00a0a76a79fc4d819de933b36db7803b288db38ae2f637111537680505c81')
sha256sums=('b2e590636f37ff13d8bac06b2ab6d391f14f04f3416327f2129ee1cf5fb5e73f')
conflicts=("mudita-center" "mudita-center-bin" "mudita-center-git")

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/mudita-center.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/mudita-center.desktop"\
            "${pkgdir}/usr/share/applications/mudita-center.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
