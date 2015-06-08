# Maintainer:  ainola <opp310@alh.rqh> (ROT13)

pkgname=gone-home-hib
pkgver=1.1
pkgrel=2
pkgdesc="Gone home is an interactive exploration simulator by Fullbright."
arch=('i686' 'x86_64')
url="http://www.gonehomegame.com/"
license=('custom: commercial')
depends=('glu' 'libxext' 'libxcursor')
source=("hib://GoneHome_v${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.install")
sha256sums=("ecd01fcde184f7d1937579e7d5d4a791007887b88f9baa10039747166bb2d097"
            "dea74a9436b2b37a63265c0606195293cb751855e2de473e678ab85600c92053"
            "ea11e510a7c52e485cf1e87eb985691029b62fc694830a0c57f14b4173ac8edd")
install=("${pkgname}.install")
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
    install -Dm755 "${srcdir}/GoneHome.${_arch}" "${pkgdir}/opt/${pkgname}/GoneHome.${_arch}"
    mv "${srcdir}/GoneHome_Data" "${srcdir}/"*.txt "${pkgdir}/opt/${pkgname}/"

    # Install Binaries/Launchers
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/${pkgname}/GoneHome.${_arch}"  "${pkgdir}/usr/bin/${pkgname}"

    # Desktop Integration
    mkdir -p "$pkgdir/usr/share/pixmaps"
    ln -s "/opt/${pkgname}/GoneHome_Data/Resources/UnityPlayer.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Fix wonky permissions
    find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;
    find "${pkgdir}/opt/${pkgname}" -type f -exec chmod 644 {} \;
    chmod 755 "${pkgdir}/opt/${pkgname}/GoneHome.${_arch}"
}
