# Maintainer:  ainola <opp310@alh.rqh> (ROT13)
# Contributor: Gerardo Marset <gammer1994@gmail.com>

pkgname=amnesia-tdd-hib
pkgver=1.3.1
pkgrel=1
pkgdesc="Amnesia: The Dark Descent is a first person survival horror game. (Humble Bundle version)"
arch=('i686' 'x86_64')
url="http://www.amnesiagame.com/"
license=('custom: commercial')
makedepends=('unzip')
depends=('sdl2' 'glu' 'openal' 'libtheora' 'libvorbis' 'libxft')
conflicts=('amnesia-tdd')
source=("hib://amnesia_tdd_${pkgver}.sh"
        "${pkgname}-justine.sh"
        "${pkgname}.desktop")
noextract=("amnesia_tdd_${pkgver/_/-}.sh")
sha256sums=("00b4486d64e0ed4c64dd3f1e718adf08a063fede4b5bb215fbda5e6c034d013a"
            "3cf52e2a5eab7154e182a7c3a6d3172f647df1e5c1d06cc9115c8dc95f0478da"
            "bf7c6c5d1c214ca47e8cbb38dc175ca1e258ef1a44a2dd480d4a60ec0c98d7e0")
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
    # Unzip will produce an error code because it is unable to unzip the Mojo Installer.
    # Therefore, a conditional into a no-op command will keep the PKGBUILD from failing
    # Of course, if you have any real problems unzipping the PKGBUILD will not abort.
    unzip -d "${srcdir}" "amnesia_tdd_${pkgver/_/-}.sh" || :
    mkdir -p "${pkgdir}/opt/${pkgname}"
    mv "${srcdir}/data/noarch/"* "${pkgdir}/opt/${pkgname}"
    mv "${srcdir}/data/${_arch}/"* "${pkgdir}/opt/${pkgname}"

    # Install Binaries/Launchers
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/${pkgname}/Amnesia.bin.${_arch}"  "${pkgdir}/usr/bin/${pkgname}"
    ln -s "/opt/${pkgname}/Launcher.bin.${_arch}" "${pkgdir}/usr/bin/${pkgname}-launcher"
    install -Dm755 "${pkgname}-justine.sh" "${pkgdir}/usr/bin"

    # Install License
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${srcdir}/data/EULA/"* "${pkgdir}/usr/share/licenses/${pkgname}/"

    # Install Desktop Integration
    mkdir -p "$pkgdir"/usr/share/{pixmaps,applications}
    ln -s "/opt/${pkgname}/Amnesia.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
