# Maintainer: Ainola

pkgname=gog-the-cat-lady
pkgver=2.2.0.6
pkgrel=3
pkgdesc="The Cat Lady is a psychological horror graphic adventure game developed by Remigiusz Michalski."
url="http://www.thecatlady.co.uk/"
license=('custom')
arch=('i686' 'x86_64')
depends=('ags')
makedepends=('icoutils' 'innoextract')
optdepends=('xdg-utils: xdg .desktop file support')
source=("gog://setup_the_cat_lady_${pkgver}.exe" \
        "gog-the-cat-lady.desktop")
sha256sums=('0d8cb4aee4b416b5d27c7510bb7caaba11a6dbee105eb979ef87da098b41dd44'
            '8cf30399929bab298d8f9fdbf64280362205f8580fa7e0f7e4c53176d5ac73cb')
# You need to download the gog.com installer file manually or with lgogdownloader.
# Or you can configure DLAGENTS in makepkg.conf to auto-search through a directory
# containing gog.com downloads:
# DLAGENTS=('gog::/usr/bin/find /path/to/downloads -name $(echo %u | cut -c 7-) -exec ln -s \{\} %o \; -quit')
DLAGENTS+=('gog::/usr/bin/echo "Could not find \"$(echo %u | cut -c 7-)\". Manually download it to \"$(pwd)\", or set up a gog:// DLAGENT."; exit 1')

# Prevent compressing final package
PKGEXT='.pkg.tar'

package(){
    #extract game files from gog installer
    innoextract -e "${srcdir}/setup_the_cat_lady_${pkgver}.exe" -d "${srcdir}"

    #nab icons from the .ico
    mkdir "${srcdir}/icons"
    icotool -x -o "${srcdir}/icons" "${srcdir}/app/goggame-1207659201.ico"

    #install game files
    install -d "${pkgdir}/opt/${pkgname}/"
    cp -r "${srcdir}/app/"* "${pkgdir}/opt/${pkgname}/"
    chown -R root:root "${pkgdir}/opt/${pkgname}"

    #install icons for system to use
    for size in 16 32 48 256; do
        install -D -m 644 "${srcdir}/icons/"*"${size}x${size}x32.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/gog-the-cat-lady.png"
    done

    #install .desktop file
    install -D -m 644 "${srcdir}/gog-the-cat-lady.desktop" \
        "${pkgdir}/usr/share/applications/gog-the-cat-lady.desktop"
}
