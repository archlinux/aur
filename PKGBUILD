# Maintainer: Mike Parks <mparks@tkware.info>
#
# This PKGBUILD only contains the engine binary.
# The retail Freespace 2 data is required to play the
# original game and most mods.  You can use a non-AUR/pacman'd
# copy, but you'll be on your own as far as running the game
# and mods are concerned.
#
# Check the AUR package 'fs2_open-data' for details.
#
# This AppImage and its release process is somewhat
# idiosyncratic.

_pkgname=fs2_open
_pkgver=21_4_0
_pkgrelease=release_${_pkgver}
_appimage="${_pkgname}_${_pkgver}_x64.AppImage"
_licensefile="Unlicense.md"
_desktopfile="fso.desktop"

pkgname=fs2_open-appimage
pkgver=21.4.0
pkgrel=1
pkgdesc="An enhancement of the FreeSpace 2 engine, AppImage version"
arch=('x86_64')
url="https://github.com/scp-fs2open/fs2open.github.com"
license=('custom:Unlicense')
depends=('zlib' 'hicolor-icon-theme')
optdepends=('fs2_open-data')
conflicts=('fs2_open' 'fs2_open-git')
options=(!strip)
source=("${url}/releases/download/${_pkgrelease}/${_pkgname}_${_pkgver}-builds-Linux.tar.gz"
        "https://raw.githubusercontent.com/scp-fs2open/fs2open.github.com/${_pkgrelease}/${_licensefile}")
sha256sums=('3f856e0b852613b41890db83f4392580aaa3f5e32dffc33b508da4e0fd9c7e0f'
            'c8a0ed607299ef766627afa6091d2908b50ed4b9dc1b691b0058e6ba4b1b9a79')

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
    install -Dm644 "${srcdir}/${_licensefile}" "${pkgdir}/opt/${_pkgname}/${_licensefile}"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_desktopfile}" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/app_icon.png" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/${_pkgname}/${_licensefile}" "$pkgdir/usr/share/licenses/${pkgname}"
}

