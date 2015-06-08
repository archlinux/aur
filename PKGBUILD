# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgname=tower-of-guns
pkgver=1414520623
pkgrel=1
pkgdesc='Tower of Guns is a fast-paced, first-person shooter for the twitch gamer, featuring a few randomized elements to keep each playthrough fresh.'
arch=('i686' 'x86_64')
url='http://www.towerofguns.com/'
license=('custom')
if [ "$CARCH" = "x86_64" ]; then
    depends=('lib32-openal' 'lib32-libvorbis' 'lib32-gcc-libs' 'lib32-libgl' 'lib32-libxext')
else
    depends=('openal' 'libvorbis' 'gcc-libs' 'libgl' 'libxext')
fi
options=('!strip')
_gamepkg="TowerOfGuns_Linux_${pkgver}.sh"
source=("${pkgname}.desktop"
        "${pkgname}.sh"
        "hib://${_gamepkg}")
md5sums=('c5848b7ef54506f7538d26e5335609c4'
         '09390a3d0f46508537e8d5d0ab8f8297'
         '44878e651e2e06461262ce5cac5e8d12')
noextract=("${_gamepkg}")
install=$pkgname.install
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
    bsdtar xzf "${_gamepkg}"
    rm -rf scripts meta
}

package(){
    install -dm755 "${pkgdir}/opt/${pkgname}"

    cd "${srcdir}/data/noarch"
    find . -type f -exec install -Dm644 {} \
        "${pkgdir}/opt/${pkgname}/{}" \;

    cd "${srcdir}/data/x86"
    rm TowerOfGuns.sh
    find . -type f -exec install -Dm644 {} \
        "${pkgdir}/opt/${pkgname}/{}" \;

    chmod 755 "${pkgdir}/opt/tower-of-guns/Binaries/Linux/UDKGame-Linux"

    install -Dm644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
