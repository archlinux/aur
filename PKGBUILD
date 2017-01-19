# Maintainer: James Zhu <james.zhu.engineer@gmail.com>

pkgname=gog-spacechem
_pkgname=spacechem
pkgver=2.0.0.5
pkgrel=6
pkgdesc="A puzzle game where you build elaborate chemical factories."
url="http://www.zachtronics.com/spacechem/"
license=('custom')
arch=('i686' 'x86_64')
depends_i686=('glibc' 'alsa-lib' 'sdl' 'sdl_image' 'sdl_mixer' 'ncurses5-compat-libs'
              'libjpeg-turbo' 'libpng12' 'glu' 'libtiff' 'fluidsynth' 'libcaca' 'sqlite')
depends_x86_64=('lib32-glibc' 'lib32-alsa-lib' 'lib32-sdl' 'lib32-sdl_image' 'lib32-sdl_mixer'
         'lib32-ncurses5-compat-libs' 'lib32-libjpeg-turbo' 'lib32-libpng12'
         'lib32-glu' 'lib32-libtiff' 'lib32-fluidsynth' 'lib32-libcaca'
         'lib32-sqlite')
source=("gog://${pkgname//-/_}_${pkgver}.sh"
        "${pkgname}.desktop"
        "${pkgname}.patch")
sha256sums=('c009d9bdd2c343700ac7e6681f640d3c5a6f362c7b5931753b26cd5f7ec635c3'
            '13163c5848f639d672c5802b28df8d192cd8639119b65b9db31982915757824c'
            '5fd3aba4d99000f15b125f868aa27b7e7d16f6b448b3cc92ab05c4d41ddf1037')

# You need to download the gog.com installer file manually or with lgogdownloader.
DLAGENTS+=("gog::/usr/bin/echo %u - This is is not a real URL, you need to download the GOG file manually to \"$PWD\" or setup a gog:// DLAGENT. Read this PKGBUILD for more information.")

# Prevent compressing final package
PKGEXT='.pkg.tar'

prepare(){
    # Unzip will produce an error code because it is unable to unzip the Installer.
    # Therefore, a conditional into a no-op command will keep the PKGBUILD from failing
    # Of course, if you have any real problems unzipping the PKGBUILD will not abort.
    unzip "${pkgname//-/_}_${pkgver}.sh" || :

    cd "${srcdir}"
    echo $PWD
    patch -Np0 < ./gog-spacechem.patch

    cd "${srcdir}/data/noarch"
    sed -r -i \
    's/(CURRENT_DIR="\$\( cd "\$\( dirname )'`
      `'"\$\{BASH_SOURCE\[0\]\}"(.*$)'`
      `'/\1$( readlink -nf "${BASH_SOURCE[0]}" )\2/' \
    "start.sh"
}

package(){
    cd "${srcdir}/data/noarch"
    # Install game
    install -d "${pkgdir}/opt/${pkgname}/"
    install -d "${pkgdir}/opt/${pkgname}/support"
    install -d "${pkgdir}/usr/bin/"
    cp -r "game/" "${pkgdir}/opt/${pkgname}/"
    cp -r "lib/" "${pkgdir}/opt/${pkgname}/lib/"
    install -Dm755 "start.sh" "gameinfo" "${pkgdir}/opt/${pkgname}/"
    install -Dm755 support/*.{sh,shlib} "${pkgdir}/opt/${pkgname}/support"

    # Desktop integration
    install -Dm 644 "support/icon.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "docs/End User License Agreement.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    ln -s "/opt/${pkgname}/start.sh" "${pkgdir}/usr/bin/${pkgname}"
}
