# Maintainer:  postblue <postblue+aurpostblue.info>
# Contributor: ainola <opp310@alh.rqh> (ROT13)
# Contributor: Gerardo Marset <gammer1994@gmail.com>

pkgname=amnesia-tdd
pkgver=1.2.1
pkgrel=4
pkgdesc="Amnesia: The Dark Descent is a first person survival horror game."
arch=('i686' 'x86_64')
url="http://www.amnesiagame.com/"
license=('custom')
depends=('libxft')
conflicts=('amnesia-tdd-hib')
source=("local://amnesia_tdd-${pkgver}-3.sh")
sha256sums=("5ced96a2ce619a44647f6cbd8190000ec48df41c621f1b6ccbeba537e1fc89e5")
[ "$CARCH" == "x86_64" ] && _suffix=_64
# Prevent compressing final package
PKGEXT='.pkg.tar'

package() {
    # Use autoextractor
    sh amnesia_tdd-${pkgver}-3.sh --target "${srcdir}/tmp" --unattended --accept-license --destdir "${srcdir}"

    # Delete unneeded uninstall file
    rm "${srcdir}/Amnesia/uninstall.sh"

    # Substitute the building directory with the installation one (/opt/Amnesia)
    sed -i "s|${srcdir}/|/opt/|" Amnesia/*.desktop

    # Install Binaries and Launchers
    mkdir -p "${pkgdir}/opt/Amnesia"
    mv "${srcdir}/Amnesia" "${pkgdir}/opt/"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/Amnesia/Amnesia.bin${_suffix/_/}" "${pkgdir}/usr/bin/${pkgname}"
    ln -s "/opt/Amnesia/Launcher.bin${_suffix/_/}" "${pkgdir}/usr/bin/${pkgname}-launcher"

    # Install License Files
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "/opt/Amnesia/EULA_*.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/"

    # Install Desktop Files
    mkdir -p "${pkgdir}"/usr/share/{pixmaps,applications}
    ln -s "/opt/Amnesia/Amnesia.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    ln -s "/opt/Amnesia/AmnesiaTheDarkDescent.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
