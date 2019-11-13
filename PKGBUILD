# Maintainer: rsteube <rsteube@users.noreply.github.com>
pkgname=dngconverter
pkgver=12.0
pkgrel=1
pkgdesc='Adobe DNG Converter'
arch=('x86_64')
url='http://www.adobe.com/go/dng_converter_win/'
license=('custom: commercial')
depends=('wine')
makedepends=('wine')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("http://download.adobe.com/pub/adobe/dng/win/DNGConverter_${pkgver/./_}.exe"
        'dngconverter'
        '_dngconverter')
sha1sums=('0fb73ad9a1159dc2b14463b5b233cdc36dc1377f'
          'SKIP'
          'SKIP')

build() {
    install -m755 -d "$srcdir"/tmp "$srcdir"/tmp/env "$srcdir"/tmp/local
    export WINEPREFIX="$srcdir"/tmp/env
    export XDG_DATA_HOME="$srcdir"/tmp/local
    wine "${srcdir}"/DNGConverter_${pkgver/./_}.exe /S
    pkill -f 'C\:\\windows\\system32\\explorer\.exe C:\\Program Files\\Adobe'
}

package() {
    mkdir -p "${pkgdir}/usr/share/${pkgname}" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/zsh/site-functions"
    cp _dngconverter "${pkgdir}/usr/share/zsh/site-functions/"
    cp -ra "${srcdir}/tmp/env/drive_c/Program Files/Adobe/"* "${pkgdir}/usr/share/${pkgname}/"
    cp -ra "${srcdir}/tmp/env/drive_c/ProgramData/Adobe/"* "${pkgdir}/usr/share/${pkgname}/"
    find "${pkgdir}" -type d -exec chmod 755 "{}" \;
    find "${pkgdir}" -type f -exec chmod 644 "{}" \;
    cp dngconverter "${pkgdir}/usr/bin/"
}
