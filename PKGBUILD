# Maintainer: Vincent Bauchart <vincent.bauchart at tutanota dot com>
_pkgname=trustbuilder
pkgname=trustbuilder-appimage
pkgver=6.38.0.5319
pkgrel=1
pkgdesc='Trustbuilder Authenticator / AppImage version'
arch=(x86_64)
url=https://www.trustbuilder.com/
license=(GPL)
_appimage="Authenticator6-Linux.AppImage"
noextract=("${_appimage}")
provides=('trustbuilder')
conflicts=('trustbuilder')
options=(!strip !debug)
source=("${_appimage}::https://download.trustbuilder.com/wp-content/uploads/${_appimage}")
sha256sums=('e05796e8ddcf072afca303eb022931510b59dde9ae6e64e812cbad8ccc584c73')
appname="trustbuilder"

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=.*|Exec=/usr/bin/${appname} %U|"\
        "squashfs-root/authenticator 6.desktop"

    # We need to match the WMClass of the AppImage which is different from the provided desktop file
    sed -i -E "s|StartupWMClass=.*|StartupWMClass=Authenticator 6|"\
        "squashfs-root/authenticator 6.desktop"

    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/authenticator 6.desktop"\
            "${pkgdir}/usr/share/applications/${appname}.desktop"

    # Icon image
    install -dm755 "${pkgdir}/usr/share/icons/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/authenticator 6.png" "${pkgdir}/usr/share/icons"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${appname}"
}

pkgver() {
    grep "X-AppImage-Version" "${srcdir}/squashfs-root/authenticator 6.desktop" | sed 's/.*=\(.*\)/\1/'
}
