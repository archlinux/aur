# Maintainer:  ainola <opp310@alh.rqh> (ROT13)

pkgname=140-hib
pkgver=1389820765
pkgrel=1
pkgdesc="140 is a challenging minimalistic platformer with abstract colorful graphics."
arch=('i686' 'x86_64')
url="http://www.game140.com/"
license=('custom: commercial')
depends=('glu')
depends_i686=('gtk2')
depends_x86_64=('lib32-gtk2')
source=("hib://140_Linux_${pkgver}.zip"
        "${pkgname}.desktop")
sha256sums=("64f5831e60d4b369bd315698fff1e54e2ad088302ad204076ba491e156ce96bb"
            "a81be607cd7a7a7795ddeed0386d9d62eaffb56651d4217e99684ce07ea53883")
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
    install -Dm755 "${srcdir}/140.${_arch}" "${pkgdir}/opt/${pkgname}/140.${_arch}"
    mv "${srcdir}/140_Data" "${pkgdir}/opt/${pkgname}/"

    # Install Binaries/Launchers
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/${pkgname}/140.${_arch}"  "${pkgdir}/usr/bin/${pkgname}"

    # Desktop Integration
    mkdir -p "$pkgdir/usr/share/pixmaps"
    ln -s "/opt/${pkgname}/140_Data/Resources/UnityPlayer.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Fix wonky permissions
    find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;
    find "${pkgdir}/opt/${pkgname}" -type f -exec chmod 644 {} \;
    chmod 755 "${pkgdir}/opt/${pkgname}/140.${_arch}"
}
