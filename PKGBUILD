# Maintainer: Gabriel-Andrew Pollo-Guilbert <gabrielpolloguilbert@gmail.com>
#
# You can define $TAGSCANNER_WINEPREFIX environment variable to hardcode the $WINEPREFIX
# of wine running TagScanner, the  is default '~/.wine-tagscanner'.

pkgname=tagscanner
pkgver=6.1.16
pkgrel=1
pkgdesc='Powerful tool for organizing and managing your music collection'
arch=('x86_64')
url='https://www.xdlab.ru/en/'
license=('custom')
depends=('wine')

source=('tagscanner.sh'
        "https://www.xdlab.ru/files/tagscan-${pkgver}.zip")
md5sums=('2a07e489f02b4897ff10f818309101d7'
         'SKIP')

package() {
    mkdir -p "${pkgdir}/opt/tagscanner/"
    cp -r "${srcdir}/"* "${pkgdir}/opt/tagscanner/"
    rm -f "${pkgdir}/opt/tagscanner/tagscan-${pkgver}.zip"
    rm -f "${pkgdir}/opt/tagscanner/tagscanner.sh"

    mkdir -p "${pkgdir}/usr/bin/"
    install -Dm755 "${srcdir}/tagscanner.sh" "${pkgdir}/usr/bin/tagscanner"

    sed -i 's#${REPLACE_WINEARCH}#win32#g' "${pkgdir}/usr/bin/tagscanner"

    if [[ -z "$TAGSCANNER_WINEPREFIX" ]]; then
        sed -i "s#\${REPLACE_WINEPREFIX}#\$HOME/.wine-tagscanner#g" "${pkgdir}/usr/bin/tagscanner"
    else 
        sed -i "s#\${REPLACE_WINEPREFIX}#${TAGSCANNER_WINEPREFIX}#g" "${pkgdir}/usr/bin/tagscanner"
    fi
}
