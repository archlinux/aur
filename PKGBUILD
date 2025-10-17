# Maintainer: Jonas Leder <info@jonasled.de>
# Contributor: Borhaneddine GUEMIDI <guemidi borhane at aina dot dz>
# Contributor: Eli <solaceiix at gmail dot com> 
# Based on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html

_pkgname=aptakube

pkgname="${_pkgname}"-appimage
provides=("aptakube")
pkgver=1.13.5
pkgrel=1
pkgdesc="A modern and lightweight Kubernetes desktop client to help you operate workloads on multiple clusters. (free to use during the public preview)"
arch=('x86_64')
url="https://aptakube.com/"
license=('Proprietary')
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://releases.aptakube.com/${_pkgname}_${pkgver}_amd64.AppImage")
noextract=("${_appimage}")
sha256sums_x86_64=('4963ee94497dc132c5c60b8684aeac99b9de1f1c5d078e2aa256e86a20c511ac')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/${_pkgname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    # install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    # install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    # ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
