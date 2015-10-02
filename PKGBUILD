# Maintainer: ainola

pkgname=qube-hib
pkgver=2015052901
pkgrel=2
pkgdesc="Q.U.B.E: Director’s Cut is the definitive version of the brain-twisting first-person puzzler."
arch=('i686' 'x86_64')
url="http://qube-game.com/"
license=('custom: commercial')
depends_i686=('sdl2' 'openal' 'libvorbis')
depends_x86_64=('lib32-sdl2' 'lib32-openal' 'lib32-libvorbis')
source=("hib://QUBE-Linux-${pkgver}.sh"
        "${pkgname}.desktop")
sha256sums=('c38a850bbfa4a7396352b750b1351d7afa9df1aa6d77676094fcce9a99c37d21'
            '1151fddc954882c0be9d8fd0bef498a84634e8c348e482c74307cf385caacadf')
# Prevent compressing final package
PKGEXT='.pkg.tar'

# You need to download the Humble Bundle file manually or you can configure
# DLAGENTS in makepkg.conf to auto-download.
#
# For example, hib-dlagent (https://aur.archlinux.org/packages/hib-dlagent/)
# can be used to download files. Add something like this in your makepkg.conf
# (you need to tweak the options to your needs):
# DLAGENTS+=('hib::/usr/bin/hib-dlagent -k $KEY -u $USER -p $PASS -o %o %u')
#
# The following is just a fallback to the above to notify the user:
DLAGENTS+=("hib::/usr/bin/echo %u - This is is not a real URL, you need to download the humble bundle file manually to \"$PWD\" or setup a hib:// DLAGENT. Read this PKGBUILD for more information.")

package() {
    mkdir -p "${pkgdir}/opt/${pkgname}/"

    # Launcher and Data
    cp -R "${srcdir}/data/x86/Binaries" "${pkgdir}/opt/${pkgname}"
    cp -Ral "${srcdir}/data/noarch/"* "${pkgdir}/opt/${pkgname}"

    # Install Binaries/Launchers
    mkdir -p "${pkgdir}/usr/bin"
    # The game expects the user to be in the game dir on launch
    printf "#!/bin/sh\ncd /opt/${pkgname}/Binaries/Linux/\n ./QUBEGame-Linux" \
        > "${pkgdir}/usr/bin/${pkgname}"
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"  

    # Desktop Integration
    mkdir -p "${pkgdir}/usr/share/pixmaps/"
    ln -s "/opt/${pkgname}/QUBEIcon.png" \
          "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Permissions
    find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;
    find "${pkgdir}/opt/${pkgname}" -type f -exec chmod 644 {} \;
    chmod 755 "${pkgdir}/opt/${pkgname}/Binaries/Linux/QUBEGame-Linux"
}
