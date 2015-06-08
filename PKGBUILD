# Maintainer:  ainola <opp310@alh.rqh> (ROT13)

pkgname=jazzpunk-hib
pkgver=July6_2014
pkgrel=2
pkgdesc="Jazzpunk is an adventure comedy game and poorly made word processor (Humble Bundle Version)."
arch=('i686' 'x86_64')
url="http://jazzpunk.net/"
license=('custom: commercial')
depends=('glu' 'libxext' 'libxcursor')
source=("hib://Jazzpunk-${pkgver/_/-}-Linux.zip"
        "${pkgname}.png"
        "${pkgname}.desktop")
sha256sums=("9e6f29d87295292cf60a0173b09ccc5a5c429ec084fe2f0c7ab7732851fdf3b7"
            "c2ddb1cff681814ab56aa88cf5b64664c277fd3a9b452573c3401a08c019ffe1"
            "8f42bfbb22dfaded91a47416edae581d4b7ff3d17b77262243248ad2dd6220fc")
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
    install -Dm755 "${srcdir}/Jazzpunk.${_arch}" "${pkgdir}/opt/${pkgname}/Jazzpunk.${_arch}"
    mv "${srcdir}/Jazzpunk_Data" "${pkgdir}/opt/${pkgname}/"
    find "${pkgdir}/opt/${pkgname}/Jazzpunk_Data" -type d -exec chmod 755 {} \;
    find "${pkgdir}/opt/${pkgname}/Jazzpunk_Data" -type f -exec chmod 644 {} \;

    # Install Binaries/Launchers
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/${pkgname}/Jazzpunk.${_arch}"  "${pkgdir}/usr/bin/${pkgname}"

    # Desktop Integration
    install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
