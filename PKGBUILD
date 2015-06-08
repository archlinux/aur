# Maintainer:  Ainola <opp310@alh.rqh> (ROT13)

pkgname=brutal-legend-hib
pkgver=2013_06_15
pkgrel=1
pkgdesc="Brütal Legend is an action-adventure game with real-time strategy game elements created by Double Fine Productions (Humble Bundle version)."
arch=('i686' 'x86_64')
url="http://www.brutallegend.com"
license=('custom: commercial')
makedepends=('unzip')
depends_i686=('glu')
depends_x86_64=('lib32-glu')
source=("hib://BrutalLegend-Linux-${pkgver//_/-}-setup.bin"
        "${pkgname}.desktop")
noextract=("BrutalLegend-Linux-${pkgver//_/-}-setup.bin")
sha256sums=("133cc6f565966503d347722a9bd13dd27f86c6ff75f5586cbc4e6ef6bbb8640a"
            "d032332fc97efafb3befa639e9568d38881ba3c8d43e58a0af1ba351ae5aad0f")

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
    # Unzip will produce an error code because it is unable to unzip the Mojo Installer.
    # Therefore, a conditional into a no-op command will keep the PKGBUILD from failing
    # Of course, if you have any real problems unzipping the PKGBUILD will not abort.
    unzip -d "${srcdir}" "BrutalLegend-Linux-${pkgver//_/-}-setup.bin" || :
    mkdir -p "${pkgdir}/opt/${pkgname}"
    mv "${srcdir}/data/"* "${pkgdir}/opt/${pkgname}"

    # Launcher
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/${pkgname}/Buddha.bin.x86"  "${pkgdir}/usr/bin/${pkgname}"

    # Install Desktop Integration
    mkdir -p "$pkgdir"/usr/share/{pixmaps,applications}
    ln -s "/opt/${pkgname}/Buddha.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
