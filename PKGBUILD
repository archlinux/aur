# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=dearesther
pkgver=1.6
pkgrel=1
pkgdesc='An experimental first-person adventure, strongly driven by a fractured narrative (game sold separately)'
arch=('i686' 'x86_64')
url='http://dear-esther.com/'
license=('custom')
makedepends=('unzip')
if [ "$CARCH" = "x86_64" ]; then
    depends=('lib32-glu' 'lib32-libxi' 'lib32-gcc-libs')
else
    depends=('glu' 'libxi' 'gcc-libs')
fi
options=('!strip')
_gamepkg="install-${pkgname}-${pkgver}.bin"
source=("${pkgname}.desktop"
        "${pkgname}.sh"
        "hib://${_gamepkg}")
md5sums=('3596d66ededb400331f91e5855d79d29'
         'a5a32737beb3e795ac3c790851d69c16'
         '42ac76a31ac8782bda3e03bd8bec5bf4')
noextract=("${_gamepkg}")
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
PKGEXT='.pkg.tar.gz'

build(){
    cd "${srcdir}"

    mkdir "${pkgname}-${pkgver}"
    bsdtar -x -C "${pkgname}-${pkgver}" -f "${_gamepkg}"
}

package(){
    cd "${srcdir}/${pkgname}-${pkgver}"

    mkdir -p "${pkgdir}/opt/${pkgname}/"
    cp -Rl bin etc lib share support "${pkgdir}/opt/${pkgname}"

    install -D -m644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    install -D -m644 license.txt \
        "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"

    install -D -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
