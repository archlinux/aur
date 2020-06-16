# Maintainer: Gabriel-Andrew Pollo-Guilbert <gabrielpolloguilbert@gmail.com>
#
# You can define $TAGSCANNER_WINEPREFIX environment variable to hardcode the $WINEPREFIX
# of wine running TagScanner, the  is default '~/.wine-tagscanner'.

pkgname=tagscanner
pkgver=6.1.4
pkgrel=1
pkgdesc='Powerful tool for organizing and managing your music collection'
arch=('i686' 'x86_64')
url='https://www.xdlab.ru/en/'
license=('custom')
depends=('wine')

source=('tagscanner.sh')
md5sums=('2a07e489f02b4897ff10f818309101d7')

source_i686=("https://www.xdlab.ru/files/tagscan-${pkgver}.zip")
md5sums_i686=('f2059adbcab6f0883460a87f9b60094e')

source_x86_64=("https://www.xdlab.ru/files/tagscan-${pkgver}_x64.zip")
md5sums_x86_64=('6d63a2fda159a314f1a11a712f2c8ff7')

package() {
    mkdir -p "${pkgdir}/opt/tagscanner/"
    cp -r "${srcdir}/"* "${pkgdir}/opt/tagscanner/"
    rm -f "${pkgdir}/opt/tagscanner/tagscan-${pkgver}_x64.zip"
    rm -f "${pkgdir}/opt/tagscanner/tagscan-${pkgver}.zip"

    mkdir -p "${pkgdir}/usr/bin/"
    install -Dm755 "${srcdir}/tagscanner.sh" "${pkgdir}/usr/bin/tagscanner"

    if [[ "$arch" == 'i686' ]]; then
        sed -i 's#${REPLACE_WINEARCH}#win32#g' "${pkgdir}/usr/bin/tagscanner"
    elif [[ "$arch" == 'x86_64' ]]; then
        sed -i 's#${REPLACE_WINEARCH}#win64#g' "${pkgdir}/usr/bin/tagscanner"
    else
        echo "error: unsupported architecture '$arch'"
        exit 1
    fi

    if [[ -z "$TAGSCANNER_WINEPREFIX" ]]; then
        sed -i "s#\${REPLACE_WINEPREFIX}#~/.wine-tagscanner#g" "${pkgdir}/usr/bin/tagscanner"
    else 
        sed -i "s#\${REPLACE_WINEPREFIX}#${TAGSCANNER_WINEPREFIX}#g" "${pkgdir}/usr/bin/tagscanner"
    fi
}
