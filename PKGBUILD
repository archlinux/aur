# Maintainer: Tai Lam <taivlam-aur-mpr [dot] tinsmith796 [at] silomails [dot] com>
# Contributor: Kyle Phillips <kyle@pkyle.me>
# Based on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html

_pkgname=mudita-center
pkgname="${_pkgname}"-appimage
pkgver=4.0.0
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
sha512sums=('959c40026cce17168ef4091353ea632940c78d28a9feebbd0338e5ea705648d5b957cebe84fb3a95b34b8eea9a5d3eb73c20cf77d1d5062da28ec98be7401505')
sha256sums=('ecf0c1f4dba0ac470e8330407eb30bfb4bb897bf3fa3a7e6098214fd0be3d3cf')
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
