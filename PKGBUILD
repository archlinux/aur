_pkgname=speed-dreams
_pkgver=2.3.0
_pkgrelease=release_${_pkgver}
_appimage="${_pkgname}-${_pkgver}-x86_64.AppImage"
_desktopfile="net.speed_dreams.desktop"

pkgname=speed-dreams-appimage
pkgver=2.3.0
pkgrel=1
pkgdesc="Speed Dreams is a fork of TORCS which aims to implement exciting new features, improving visual and physics realism. Appimage version"
arch=('x86_64')
url="http://speed-dreams.sourceforge.net/"
license=('GPL3')
depends=('libxcrypt-compat')
conflicts=('speed-dreams-svn')
options=(!strip)
source=("${_appimage}::https://sourceforge.net/projects/speed-dreams/files/${pkgver}/${_appimage}/download")
sha256sums=('85e097b30864ab5fb2f7e5107f39a97f3067898ac699b7fd077d99d8abc3b5b7')

prepare() {
    chmod +x ${_appimage}
    ./${_appimage} --appimage-extract > /dev/null
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=.*|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" "squashfs-root/${_desktopfile}"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_desktopfile}" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/${_pkgname}.png" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}

