# Maintainer:  ainola <opp310@alh.rqh> (ROT13)

pkgname=mirrormoon-ep-hib
pkgver=1392070609
pkgrel=1
pkgdesc="MirrorMoon EP is a space adventure that begins on a red planet and its unique moon. "
arch=('i686' 'x86_64')
url="http://www.mirrormoongame.com/"
license=('custom: commercial')
depends=('glu')
depends_i686=('gtk2')
depends_x86_64=('lib32-gtk2')
source=("hib://MirrorMoonEP_linux_${pkgver}.tar.gz"
        "${pkgname}.desktop")
sha256sums=("9b3a30e18503941621eb111f8754729bd764bf3efb847383ffa867d18f05c4de"
            "a1b40b1a6a9bf1541c1c8d6af73a142790c595ffda3b9335d00145670f64e15e")
[ "$CARCH" == "x86_64" ] && _arch="x86_64" || _arch="x86"
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
    # Launcher and Data
    install -Dm755 "${srcdir}/MirrorMoonEP.${_arch}" "${pkgdir}/opt/${pkgname}/MirrorMoonEP.${_arch}"
    mv "${srcdir}/MirrorMoonEP_Data" "${pkgdir}/opt/${pkgname}/"

    # Install Binaries/Launchers
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/${pkgname}/MirrorMoonEP.${_arch}"  "${pkgdir}/usr/bin/${pkgname}"

    # Desktop Integration
    mkdir -p "$pkgdir/usr/share/pixmaps"
    ln -s "/opt/${pkgname}/MirrorMoonEP_Data/Resources/UnityPlayer.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Fix wonky permissions
    find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;
    find "${pkgdir}/opt/${pkgname}" -type f -exec chmod 644 {} \;
    chmod 755 "${pkgdir}/opt/${pkgname}/MirrorMoonEP.${_arch}"
}
