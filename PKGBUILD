# Maintainer:  ainola <opp310@alh.rqh> (ROT13)

pkgname=outlast-hib
pkgver=1.01
pkgrel=2
pkgdesc="Hell is an experiment you can't survive in Outlast."
arch=('i686' 'x86_64')
url="http://www.redbarrelsgames.com/"
license=('custom: commercial')
depends=('libvorbis' 'sdl2')
source=("hib://Outlast-${pkgver}.sh"
        "${pkgname}.desktop")
sha256sums=("76d2f1253f0e29a02712bb05c87ddca2b14af98b65ba42220c180e00ec7e7ff3"
            "15884e4cf9229071fc8e1813f76f1c869c727332af2abda6410d80a829e96d3f")
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
    cp -R "${srcdir}/data/${CARCH}/Binaries" "${pkgdir}/opt/${pkgname}"
    cp -Ral "${srcdir}/data/noarch/"* "${pkgdir}/opt/${pkgname}"

    # Install Binaries/Launchers
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/Binaries/Linux/OLGame.${CARCH}" \
          "${pkgdir}/usr/bin/outlast"

    # Desktop Integration
    mkdir -p "${pkgdir}/usr/share/pixmaps/"
    ln -s "/opt/${pkgname}/OLGame/Icon.png" \
          "${pkgdir}/usr/share/pixmaps/outlast.png"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Permissions
    find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;
    find "${pkgdir}/opt/${pkgname}" -type f -exec chmod 644 {} \;
    chmod 755 "${pkgdir}/opt/${pkgname}/Binaries/Linux/OLGame.${CARCH}"
}
