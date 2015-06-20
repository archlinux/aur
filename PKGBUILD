# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=swordandsworcery
pkgver=1.02
pkgrel=2
pkgdesc='An exploratory action adventure videogame with an emphasis on audiovisual style (game sold separately)'
arch=('i686' 'x86_64')
url='http://www.swordandsworcery.com/'
license=('custom')
if [ "$CARCH" == "x86_64" ]; then
    depends=('lib32-glu' 'lib32-mesa' 'lib32-curl' 'lib32-sdl')
else
    depends=('glu' 'mesa' 'curl' 'sdl')
fi
options=('!strip')
_gamepkg="${pkgname}_${pkgver}.tar.gz"
source=("${pkgname}.desktop"
        'http://www.swordandsworcery.com/storage/icon_512.png'
        "hib://${_gamepkg}")
noextract=("${_gamepkg}")
md5sums=('e0aca231d3b4bf8c68bf799f1e9b1201'
         '071d74203e593188ee28c0913d57d4ff'
         '2ede02c0552baeb12979bf9a68fdf399')
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
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Download the file manually to \"$(pwd)\" or setup hib:// DLAGENT in /etc/makepkg.conf"; echo "Read this PKGBUILD for more info."; exit 1')
PKGEXT='.pkg.tar'

build(){
    cd "${srcdir}"
    mkdir "${pkgname}-${pkgver}"
    bsdtar -x -C "${pkgname}-${pkgver}" -f "${_gamepkg}"
}

package(){
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -d "${pkgdir}/opt/"
    cp -rl . "${pkgdir}/opt/${pkgname}"

    # Use system-provided versions
    rm "${pkgdir}/opt/${pkgname}/lib/libstdc++.so.6.0.16"
    rm "${pkgdir}/opt/${pkgname}/lib/libstdc++.so.6"
    rm "${pkgdir}/opt/${pkgname}/lib/libcurl.so"
    rm "${pkgdir}/opt/${pkgname}/lib/libSDL-1.2.so.0"

    install -D -m644 "${srcdir}/icon_512.png" \
        "${pkgdir}/opt/${pkgname}/icon_512.png"

    install -D -m644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    install -D -m644 eula.txt \
        "${pkgdir}/usr/share/licenses/${pkgname}/eula.txt"

    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/run.sh" "${pkgdir}/usr/bin/${pkgname}"
}
