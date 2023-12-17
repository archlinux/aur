# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=swordandsworcery
pkgver=1.3.b807b
pkgrel=1
pkgdesc='An exploratory action adventure videogame with an emphasis on audiovisual style (game sold separately)'
arch=('x86_64')
url='http://www.swordandsworcery.com/'
license=('custom')
depends=('glu' 'sdl2')
options=('!strip')
_gamepkg="sworcery_linux_64_b807bcb084022f3c98bc61c941bc5aeadc55fe05_31.7z"
source=("${pkgname}.desktop"
        'http://www.swordandsworcery.com/storage/icon_512.png'
        "hib://${_gamepkg}")
noextract=("${_gamepkg}")
sha256sums=('d1455774219b20d96cba1e99ab8c91b9ab1bbfad1b60c525be204e7b1cfa04fb'
            '58ada6467a0606b6801eb0d1d3102cf4b32c68e32927ffa468df8f7c85fe8830'
            '4aef955b7b4cec0a367b5f58081bac2ad9f0bc8ee2bf30c96ea4e0ea347dc2c0')
# You can download the Humble Indie Bundle file manually, or you can configure
# DLAGENTS in makepkg.conf or ~/.makepkg.conf to auto-download.
#
# For example, to auto-search through a directory containing Huble Bundle
# downloads, set something like this in your makepkg.conf:
# DLAGENTS=('hib::/usr/bin/bash -c /usr/bin/find\ /path/to/downloads\ -name\ $(echo\ %u\ |\ cut\ -c\ 7-)\ -exec\ ln\ -s\ \\{\\}\ %o\ \\\;\ -quit')
#
# The escaping is a bit obnoxious for this use, so you probably want to make a
# shell script for the command:
# DLAGENTS=('hib::/home/youruser/hib-search.sh %u %o')
#
# /home/youruser/hib-search.sh:
# #!/bin/bash
# find /path/to/downloads -name ${1#hib://} -exec ln -s \{\} $2 \; -quit
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Download manually to \"$(pwd)\" or setup hib:// DLAGENT in /etc/makepkg.conf."; echo "Read this PKGBUILD for more info."; exit 1')
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
    rm "${pkgdir}/opt/${pkgname}/lib/libGLU.so.1"
    rm "${pkgdir}/opt/${pkgname}/lib/libSDL2-2.0.so.0"

    install -D -m644 "${srcdir}/icon_512.png" \
        "${pkgdir}/opt/${pkgname}/icon_512.png"

    install -D -m644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    install -D -m644 eula.txt \
        "${pkgdir}/usr/share/licenses/${pkgname}/eula.txt"

    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/run.sh" "${pkgdir}/usr/bin/${pkgname}"
}
