# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=psychonauts
pkgver=20130506
_srcpkgver=05062013
pkgrel=1
pkgdesc='A mind-bending platforming adventure (game sold separately)'
arch=('i686' 'x86_64')
url='http://www.psychonauts.com/'
license=('custom')
makedepends=('unzip')
if [ "$CARCH" = "x86_64" ]; then
    depends=('lib32-sdl' 'lib32-openal' 'bash' 'lib32-gcc-libs')
    optdepends=('lib32-libtxc_dxtn: texture decoding for open source ATI and Intel drivers')
else
    depends=('sdl' 'openal' 'bash' 'gcc-libs')
    optdepends=('libtxc_dxtn: texture decoding for open source ATI and Intel drivers')
fi
options=('!strip')
_gamepkg="${pkgname}-linux-${_srcpkgver}-bin"
source=("${pkgname}.desktop"
        "psychonauts.sh"
        "hib://${_gamepkg}")
md5sums=('91be805610718903bea5c3a3d1d127cf'
         'fa33971376bd3824a1202e37220f72a5'
         'cd207acda0613cf06bc153b4b85dceb3')
# You can download the Humble Indie Bundle file manually, or you can configure
# DLAGENTS in makepkg.conf to auto-download.
#
# For example, to use hib-dlagent to download files set something like this in
# your makepkg.conf (change/add -k and add -u/-p to your needs):
# DLAGENTS=('hib::/usr/bin/hib-dlagent -k 1a2b3c -o %o $(echo %u | cut -c 7-)')
#
# To auto-search through a directory containing Humble Bundle downloads, you
# could set:
# DLAGENTS=('hib::/usr/bin/find /path/to/downloads -name $(echo %u | cut -c 7-) -exec ln -s \{\} %o \; -quit')
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Download manually to \"$(pwd)\" or setup hib:// DLAGENT in /etc/makepkg.conf."; echo "Read this PKGBUILD for more info."; exit 1')
PKGEXT='.pkg.tar'

build(){
    cd "${srcdir}"
    unzip -o "${_gamepkg}" -d "${pkgname}-${pkgver}" || true
}

package(){
    cd "${srcdir}/${pkgname}-${pkgver}"

    mkdir -p "${pkgdir}/opt"
    cp -Rl data "${pkgdir}/opt/${pkgname}"

    # Use system-provided libraries
    rm "${pkgdir}/opt/${pkgname}/libSDL-1.2.so.0"
    rm "${pkgdir}/opt/${pkgname}/libopenal.so.1"

    install -D -m644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    install -D -m644 data/Documents/EULAs/EULA.rtf \
        "${pkgdir}/usr/share/licenses/${pkgname}/EULA.rtf"
    install -D -m644 "data/Documents/EULAs/Cider-EULA-de (German).rtf" \
        "${pkgdir}/usr/share/licenses/${pkgname}/Cider-EULA-de (German).rtf"
    install -D -m644 "data/Documents/EULAs/Cider-EULA-en (English).rtf" \
        "${pkgdir}/usr/share/licenses/${pkgname}/Cider-EULA-en (English).rtf"
    install -D -m644 "data/Documents/EULAs/Cider-EULA-es (Spanish).rtf" \
        "${pkgdir}/usr/share/licenses/${pkgname}/Cider-EULA-es (Spanish).rtf"
    install -D -m644 "data/Documents/EULAs/Cider-EULA-fr (French).rtf" \
        "${pkgdir}/usr/share/licenses/${pkgname}/Cider-EULA-fr (French).rtf"
    install -D -m644 "data/Documents/EULAs/Cider-EULA-it (Italian).rtf" \
        "${pkgdir}/usr/share/licenses/${pkgname}/Cider-EULA-it (Italian).rtf"

    install -D -m755 "${srcdir}/psychonauts.sh" "${pkgdir}/usr/bin/${pkgname}"
}
