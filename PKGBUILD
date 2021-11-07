# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: Denis Novikov <zlocate@solutions4biz.ru>

_pkgname=nosqlbooster4mongo
_Pkgname=nosqlbooster4mongo

pkgname="nosqlbooster4mongo"-appimage
pkgver=7.0.4
pkgrel=1
pkgdesc="NoSQLBooster for MongoDB"
arch=('x86_64')
url="https://nosqlbooster.com/"
license=('GPL3')
depends=()
options=(!strip)
_appimage="${_Pkgname}-${pkgver}.AppImage"
source=("https://s3.mongobooster.com/download/releasesv7/${_pkgname}-${pkgver}.AppImage")
md5sums=('18ba37c414e951a6394f6a42023bdd03')
noextract=("${_appimage}")

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

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
