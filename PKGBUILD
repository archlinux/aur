# Maintainer:  Quentin Retornaz <quentin dot retornaz at yahoo dot fr>

pkgname=outlast-gog
pkgver=1.01_2.0.0.2
_gogver=2.0.0.2
pkgrel=4
pkgdesc="Hell is an experiment you can't survive in Outlast."
arch=('i686' 'x86_64')
url="http://www.redbarrelsgames.com/"
license=('custom: commercial')
depends=('libvorbis' 'sdl2')
source=("local://gog_outlast_${_gogver}.sh"
        "${pkgname}.desktop")
sha256sums=("d8fb15a9ced75152525274aaec5c6522c80a8f6eadf221e854613d193c1705b6"
            "40520d618a23e6836c1a2f356e06b37b1453e0f0c5acea06bbb26b4c2d8d83dc")
# Prevent compressing final package
PKGEXT='.pkg.tar'

package() {
    mkdir -p "${pkgdir}/opt/outlast/"

    # Launcher and Data
    cp -Ral "${srcdir}/data/noarch/game/"{Binaries,Engine,OLGame} "${pkgdir}/opt/outlast"
    if [[ $CARCH = 'i686' ]]; then
        rm "${pkgdir}"/opt/outlast/Binaries/Linux/OLGame.x86_64
        rm -r "${pkgdir}"/opt/outlast/Binaries/Linux/lib/x86_64-pc-linux-gnu
    else
        rm "${pkgdir}"/opt/outlast/Binaries/Linux/OLGame.i686
        rm -r "${pkgdir}"/opt/outlast/Binaries/Linux/lib/i686-pc-linux-gnu
    fi
    mv "${pkgdir}"/opt/outlast/Binaries/Linux/OLGame{.${CARCH},}

    # Install Binaries/Launchers
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/outlast/Binaries/Linux/OLGame" \
          "${pkgdir}/usr/bin/outlast"

    # Desktop Integration
    mkdir -p "${pkgdir}/usr/share/pixmaps/"
    ln -s "/opt/outlast/OLGame/Icon.png" \
          "${pkgdir}/usr/share/pixmaps/outlast.png"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/outlast.desktop"

    # Permissions
    find "${pkgdir}/opt/outlast" -type d -exec chmod 755 {} \;
    find "${pkgdir}/opt/outlast" -type f -exec chmod 644 {} \;
    chmod 755 "${pkgdir}/opt/outlast/Binaries/Linux/OLGame"
}
